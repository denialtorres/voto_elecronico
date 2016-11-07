require './lib/recepies/bower'
require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/unicorn'
require 'mina/newrelic'
require 'mina/nginx'
require 'mina/npm'
require 'mina/sitemap_generator'

set :application, 'VotoElectronico'
set :deploy_to, '/home/deployer'
set :repository, 'git@bitbucket.org:volabit/voto-electronico.git'
set :user, 'deployer'
set :forward_agent, true
set :port, '22'
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  queue %(
echo "-----> Loading environment for '#{stage.upcase}'"
#{echo_cmd %(source ~/.bashrc)}
)
  invoke :'rbenv:load'
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
end

task jsonify_locales: :environment do
  invoke 'rake[locales:to_json]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task setup: :environment do
  queue! %(mkdir -p "#{deploy_to}/shared/log")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/shared/log")

  queue! %(mkdir -p "#{deploy_to}/shared/config")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/shared/config")

  queue! %(touch "#{deploy_to}/shared/config/database.yml")
  queue  %(echo "-----> Be sure to edit 'shared/config/database.yml'.")

  queue! %(touch "#{deploy_to}/shared/config/secrets.yml")
  queue %(echo "-----> Be sure to edit 'shared/config/secrets.yml'.")

  queue! %(mkdir -p "#{deploy_to}/shared/pids/")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/shared/pids")
end

desc 'Restarts the server'
task restart: :environment do
  invoke :'unicorn:restart'
  invoke :'nginx:restart'
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  deploy do

    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    # invoke :'npm:install'
    invoke :'bower:install_assets'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :restart
      invoke :'newrelic:notice_deployment'
      # invoke :'sitemap:refresh' if stage == 'production'
      invoke :'deploy:cleanup'
    end
  end
end

desc 'Tails the production log.'
task :logs do
  queue 'echo "Contents of the log file are as follows:"'
  queue "tail -f #{deploy_to}/shared/log/production.log"
end
