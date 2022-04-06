class NotificationsController < ApplicationController

  def index

    if nurse_signed_in?
      # 看護師と病院とで同一のIDが存在するため、通知の受信者が自分のIDで、そのIDが看護師のIDであるものを取得
      @notifications = Notification.where(recipient: current_nurse.id, nurse_id: current_nurse.id).order(created_at: :desc).page(params[:page]).per(10)
    elsif hospital_signed_in?
      # 看護師と病院とで同一のIDが存在するため、通知の受信者が自分のIDで、そのIDが病院のIDであるものを取得
      @notifications = Notification.where(recipient: current_hospital.id, hospital_id: current_hospital.id).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def create

  end

  def new
  end

  def edit
  end

end
