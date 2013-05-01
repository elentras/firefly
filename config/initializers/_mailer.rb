ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 address:         Gaston.mailer.address,
 port:            587,
 domain:          Gaston.mailer.domain,
 user_name:       Gaston.mailer.user_name,
 password:        Gaston.mailer.password,
 enable_starttls_auto: true,
 authentication: 'plain'
}
