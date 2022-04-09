class ReportMailer < ApplicationMailer
  def send_mail(mail_title, mail_content, sender_user, reported_user, user_kinds, destination)
    @mail_title = mail_title
    @mail_content = mail_content
    @sender = sender_user
    @reported_user = reported_user
    @nurse_or_hospitai = user_kinds

    # 管理者から看護師または病院にメールする際はdestinationに相手の看護師または病院のメールアドレスを入れる。
    # 空だった場合は看護師または病院から管理者への通報メール。
    # 中身がある場合は管理者からそのメールアドレスへ送信する。
    if destination.blank?
      mail(to: ENV['ADMIN_MAIL'], subject: 'Mypace_kanngoから通報メールです')
    else
      mail(to: destination, subject: 'Mypace_kanngoの管理者からメールです')
    end


  end
end
