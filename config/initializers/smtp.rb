ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '465',
  domain: 'presentsapp.herokuapp.com',
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  authentication: :plain,
  ssl: true,
  tls: true
}