  ActionMailer::Base.smtp_settings = {
    domain: 'https://tenancy-production.up.railway.app',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       Rails.credentials.dig(:sendgrid,:access_key)
}
