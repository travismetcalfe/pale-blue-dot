require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testrails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.public_file_server.enabled = true
    config.google_maps_api_key = "YOUR_API_KEY_HERE"
    # Allow application to load in iframe from main website
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => 'https://adoptastar.org'
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
