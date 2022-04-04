class ApplicationController < ActionController::Base
before_action :nurse_or_hospital?

  def nurse_or_hospital?
    if nurse_signed_in?
      @user = current_nurse
    elsif hospital_signed_in?
      @user = current_hospital
      
    end
    @notifications = Notification.where(recipient: @user).order(created_at: :desc).page(params[:page]).per(10)
  end
  
end
