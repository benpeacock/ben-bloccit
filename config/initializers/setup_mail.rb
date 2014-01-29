if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app21593188@heroku.com",
    :password       => "pa8qryth",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end
