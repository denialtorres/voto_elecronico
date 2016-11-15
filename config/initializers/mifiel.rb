Mifiel.config do |config|
  config.app_id = ENV['MIFIEL_APP_ID']
  config.app_secret = ENV['MIFIEL_APP_SECRET']
  config.base_url = 'http://localhost:3001/api/v1' if Rails.env.development?
end
