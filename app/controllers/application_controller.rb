class ApplicationController < ActionController::Base
before_action :notification_index

  def notification_index

    if nurse_signed_in?
      # 看護師と病院とで同一のIDが存在するため、user_typeで見分ける。
      # trueなら看護師宛ての通知　falseなら病院宛ての通知
      @notifications = Notification.where(recipient: current_nurse.id, user_type: true).order(created_at: :desc).page(params[:page]).per(10)
    elsif hospital_signed_in?
      @notifications = Notification.where(recipient: current_hospital.id, user_type: false).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

end
