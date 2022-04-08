class ReportMailer < ApplicationMailer
  def send_mail(mail_title, mail_content, sender_user, reported_user, user_kinds)
    @mail_title = mail_title
    @mail_content = mail_content
    @sender = sender_user
    @reported_user = reported_user
    @nurse_or_hospitai = user_kinds
    # 下記のsample2@sampleに管理者メールアドレスを入力して下さい。
    mail(to: "sample2@sample", subject: 'Mypace_kanngoから通報メールです')


  end
end
