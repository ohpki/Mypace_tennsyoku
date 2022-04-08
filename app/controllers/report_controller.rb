class ReportController < ApplicationController
  def new_mail
    @sender = params[:sender]
    @reported_user = params[:reported_user]
    @nurse_or_hospitai = params[:nurse_or_hospitai]
  end

  def send_mail
    @sender = params[:sender]
    @reported_user = params[:reported_user]
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    @nurse_or_hospitai = params[:nurse_or_hospitai]
    ReportMailer.send_mail(@mail_title, @mail_content, @sender, @reported_user, @nurse_or_hospitai).deliver_now


  end


end
