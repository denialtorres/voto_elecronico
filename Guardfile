# rubocop:disable Metrics/LineLength, Metrics/BlockLength
# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec feature)

## Uncomment to clear the screen before every task
clearing :on

## Guard internally checks for changes in the Guardfile and exits.
## If you want Guard to automatically start up again, run guard in a
## shell loop, e.g.:
##
##  $ while bundle exec guard; do echo "Restarting Guard..."; done
##
## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), the you will want to move the Guardfile
## to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|html)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{app/admin/.+\.rb})
  watch('app/models/ability.rb')
  # watch(%r{app/models/.+\.rb})
  # watch(%r{app/controllers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # watch(%r{spec/javascripts/.+\.js})
  watch(%r{spec/javascripts/.+\.js\.coffee})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|scss|html|png|jpg|coffee))).*}) { |m| "/assets/#{m[3]}" }
end

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

notification :terminal_notifier

rspec_options = {
  results_file: 'tmp/guard_rspec_results.txt',
  cmd: 'zeus test',
  all_after_pass: false,
  failed_mode: :focus
}

guard :rspec, rspec_options do
  require 'ostruct'

  # Generic Ruby apps
  rspec = OpenStruct.new
  rspec.spec = ->(m) { "spec/#{m}_spec.rb" }
  rspec.spec_dir = 'spec'
  rspec.spec_helper = 'spec/spec_helper.rb'

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| rspec.spec.call("lib/#{m[1]}") }
  watch(rspec.spec_helper)      { rspec.spec_dir }

  # Rails example
  rails = OpenStruct.new
  rails.app = %r{^app/(.+)\.rb$}
  rails.views_n_layouts = %r{^app/(.*)(\.erb|\.haml|\.slim)$}
  rails.controllers = %r{^app/controllers/(.+)_controller\.rb$}
  rails.routes = 'config/routes.rb'
  rails.app_controller = 'app/controllers/application_controller.rb'
  rails.spec_helper = 'spec/rails_helper.rb'
  rails.spec_support = %r{^spec/support/(.+)\.rb$}
  rails.factories = %r{^spec/factories/(.+)\.rb$}
  rails.views = %r{^app/views/(.+)/.*\.(erb|haml|slim)$}

  watch(rails.app) { |m| rspec.spec.call(m[1]) }
  watch(rails.views_n_layouts) { |m| rspec.spec.call("#{m[1]}#{m[2]}") }
  watch(rails.controllers) { |m| rspec.spec.call("controllers/#{m[1]}_controller") }
  watch(rails.controllers) { |m| rspec.spec.call("controllers/regression/#{m[1]}_controller") }

  watch(rails.spec_support)    { rspec.spec_dir }
  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(rails.factories)       { rspec.spec_dir }
  watch(rails.routes)          { 'spec/routing' }
  watch(rails.app_controller)  { 'spec/controllers' }
end

rubocop_opts = {
  all_on_start: false
}

guard :rubocop, rubocop_opts do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
