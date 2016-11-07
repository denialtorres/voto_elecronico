set :domain, '100.100.100.100'
set :branch, 'master'
set :rails_env, 'production'

set :shared_paths, [
  'config/database.yml',
  'log',
  'config/application.yml',
  'config/secrets.yml'
]
