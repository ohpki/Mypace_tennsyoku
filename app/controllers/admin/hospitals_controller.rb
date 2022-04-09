class Admin::HospitalsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @hospitals = Hospital.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def confirm
    @hospital = params[:hospital_id]
  end

  def destroy
    hospital = Hospital.find(params[:id])
    hospital.destroy
    redirect_to admin_hospitals_path, notice: "退会処理が完了しました"
  end
end
