class NotificationsController < ApplicationController
  before_action :nurse_or_hospital?
  def index
    @notifications = Notification.where(recipient: @user.id).order(created_at: :desc).page(params[:page]).per(10)

  end

  def create

  end

  def new
  end

  def edit
  end

  private
  def notification_params
    params.require(:notification).permit(:sender, :recipient, :action, :chat_id, :subscription_id, :scout_id)
  end

  def nurse_or_hospital?
    if nurse_signed_in?
      @user = current_nurse
    else
      @user = current_hospital
    end
  end


end
