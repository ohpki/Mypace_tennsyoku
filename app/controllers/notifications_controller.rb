class NotificationsController < ApplicationController
    def index
      if nurse_signed_in?
        # user_typeがtrueなら看護師宛ての通知　falseなら病院宛ての通知
        @notifications = Notification.where(nurse_id: current_nurse.id, user_type: true).order(created_at: :desc).page(params[:page]).per(10)
      elsif hospital_signed_in?
        @notifications = Notification.where(hospital_id: current_hospital.id, user_type: false).order(created_at: :desc).page(params[:page]).per(10)
      end

    end


end


