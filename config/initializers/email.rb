Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  :address              => ENV["MAILER_HOST"],
  :port                 => ENV["MAILER_PORT"],
  :user_name            => ENV["MAILER_USERNAME"],
  :password             => ENV["MAILER_PASSWORD"],
  :authentication       => 'plain',
  :enable_starttls_auto => true 
}
Rails.application.config.action_mailer.default_options = {
  :from => ENV["MAILER_FROM"]
}