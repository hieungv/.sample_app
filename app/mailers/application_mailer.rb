class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_NAME']
  layout "mailer"
end
