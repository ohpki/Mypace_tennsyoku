class Employer::NursesController < ApplicationController
  before_action :authenticate_hospital!

  def show
    @nurse = Nurse.find(params[:id])
    @scout = Scout.new
    @chat_room = ChatRoom.find_by(hospital_id: current_hospital.id, nurse_id: params[:id])
    @notification = Notification.new
  end

  def index
    @nurse_all = Nurse.where(job_seeking_status: true)
    @nurses = @nurse_all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def search
    @nurses = Nurse.where("address LIKE?","%#{params[:word]}%")
    .or(Nurse.where("qualification LIKE?", "%#{params[:word]}%"))
    @nurse_all = @nurses.where(job_seeking_status: true)
    @nurses = @nurse_all.order(created_at: :desc).page(params[:page]).per(10)
    render :index
  end
end
