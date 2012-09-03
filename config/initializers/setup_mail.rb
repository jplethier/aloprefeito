ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "aloprefeito.com",
  :user_name            => "bondedauff",
  :password             => "aloprefeito",
  :authentication       => "plain",
  :enable_starttls_auto => true
}