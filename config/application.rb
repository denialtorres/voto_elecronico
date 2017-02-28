require_relative 'boot'

#I get error uninitialized constant CSV when I dont used it
require 'csv'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VotoElectronico
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.default_locale = :es
    config.i18n.available_locales = [:es, :en]

    # Sane logs through lograge
    config.lograge.enabled = true
    config.lograge.custom_options = lambda { |event|
      opts = {
        params: event.payload[:params],
        time: %('#{event.time}'),
        remote_ip: event.payload[:ip]
        # end: %Q('#{event.end}'),
        # name: event.name
        # payload is a http://api.rubyonrails.org/classes/ActiveSupport/Notifications/Event.html
        # duration
        # transaction_id
      }
      if event.payload[:exception]
        quoted_stacktrace = %('#{Array(event.payload[:stacktrace]).to_json}')
        opts[:stacktrace] = quoted_stacktrace
        # will output as e.g.
        # "stacktrace":"'[\"/Users/somedev/.rvm/gems/ etc.
        # no need to include the :exception payload as it is already output
        # by the 'error' key, e.g.
        # "error":"ActionView::Template::Error:bootstrap/carousel.js isn't precompiled"
      end
      opts
    }

    # Host for generates URLs on emails
    config.action_mailer.default_url_options = { host: ENV['HOST'] }
  end
end
