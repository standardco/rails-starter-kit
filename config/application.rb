require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStarterKit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)

    config.action_mailer.delivery_method = :safety_mailer
    config.action_mailer.safety_mailer_settings = {
      allowed_matchers: [ /standardco.de/ ],
      delivery_method: :smtp,
      delivery_method_settings: {
        :address              => ENV["MAILER_HOST"],
        :port                 => ENV["MAILER_PORT"],
        :user_name            => ENV["MAILER_USERNAME"],
        :password             => ENV["MAILER_PASSWORD"],
        :authentication       => :plain,
        :enable_starttls_auto => true
      }
    }
    config.action_mailer.default_options = {
      :from                   => ENV["MAILER_FROM"]
    }
  end
end
