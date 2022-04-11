class ReportController < ApplicationController
  def new_mail
    @sender = params[:sender]
    @reported_user = params[:reported_user]
    @nurse_or_hospitai = params[:nurse_or_hospitai]
    @destination =  params[:destination]
  end

  def send_mail
    @sender = params[:sender]
    @reported_user = params[:reported_user]
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    # 通報する側とされる側で同じIDのユーザーになってしまうこともあるため、看護師なのか病院なのか分かるようにしておく。
    @nurse_or_hospitai = params[:nurse_or_hospitai]
    # 管理者からユーザーにメールをする際に下記の変数に相手のメールアドレスを入れて使う。
    @destination =  params[:destination]
    ReportMailer.send_mail(@mail_title, @mail_content, @sender, @reported_user, @nurse_or_hospitai, @destination).deliver_now
  end


end
