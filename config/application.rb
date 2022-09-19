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
    config.active_job.queue_adapter = :good_job
    config.good_job.enable_cron = ENV['DYNO']
    config.good_job.cron = {
  # Every 15 minutes, enqueue `ExampleJob.set(priority: -10).perform_later(42, name: "Alice")`
    frequent_task: { # each recurring job must have a unique key
    cron: "45 20 * * *", # cron-style scheduling format by fugit gem
    # cron: "0 8 * * *"
    class: "TaskAssignmentJob", # reference the Job class with a string
    description: "Allocation og chores, every Monday at 8:00 AM", # optional description that appears in Dashboard
  }}
   config.time_zone = 'Mountain Time (US & Canada)'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
