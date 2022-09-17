email_config = Rails.application.config_for :email

ActionMailer::Base.default_options = {
    from: email_config[:from]
}
ActionMailer::Base.raise_delivery_errors = email_config[:raise_delivery_errors]
ActionMailer::Base.smtp_settings = {
    user_name: email_config[:user_name],
    password: email_config[:password],
    domain: email_config[:domain],
    address: email_config[:address],
    port: email_config[:port],
    authentication: email_config[:authentication],
    enable_starttls_auto: email_config[:enable_starttls_auto],
    perform_deliveries: email_config[:perform_deliveries],
    delivery_method: email_config[:delivery_method]
}
unless email_config[:perform_deliveries]
  ActionMailer::Base.perform_deliveries = false
end