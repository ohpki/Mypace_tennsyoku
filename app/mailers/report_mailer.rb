class ReportMailer < ApplicationMailer
  def send_mail(mail_title, mail_content, sender_user, reported_user)
    @mail_title = mail_title
    @mail_content = mail_content
    @sender = sender_user
    @reported_user = reported_user

    mail to: "ohpkiki@gmail.com"
  end
end
