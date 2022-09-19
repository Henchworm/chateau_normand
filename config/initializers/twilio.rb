# frozen_string_literal: true

Twilio.configure do |config|
  config.account_sid = ENV['ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end
