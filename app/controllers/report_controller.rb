class ReportController < ApplicationController
  def new_mail
    @sender = params[:sender]
    @reported_user = params[:reported_user]
  end

  def send_mail
    @sender = params[:sender]
    @reported_user = params[:reported_user]
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ReportMailer.send_mail(@mail_title, @mail_content, @sender, @reported_user).deliver_now


  end


end
