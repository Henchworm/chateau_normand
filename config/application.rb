# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChateauNormand
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Every 15 minutes, enqueue `ExampleJob.set(priority: -10).perform_later(42, name: "Alice")`
    config.time_zone = 'Mountain Time (US & Canada)'
    config.eager_load_paths += %W[#{config.root}/lib]

    config.x.oauth.client_id = ENV['STRAVA_CLIENT']
    config.x.oauth.client_secret = ENV['STRAVA_SECRET']
    config.x.oauth.idp_url = 'http://localhost:3000/'
    config.x.oauth.redirect_uri = 'http://localhost:3000/oauth2-callback'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
