class ApplicationMailer < ActionMailer::Base
  default from: ENV['TESTAPP_PROD_MAIL_EMAIL']
  layout 'mailer'
end
