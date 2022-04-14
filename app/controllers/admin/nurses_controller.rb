class Admin::NursesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @nurses = Nurse.where(job_seeking_status: true).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @nurse = Nurse.find(params[:id])
  end

  def confirm
    @nurse = params[:nurse_id]
  end

  def destroy
    nurse = Nurse.find(params[:id])
    nurse.destroy
    redirect_to admin_nurses_path, notice: "退会処理が完了しました"
  end

  def search
    @nurse = Nurse.find_by("id LIKE?","#{params[:word]}")
    if @nurse.blank?
      redirect_to admin_nurses_path, notice: "IDに該当するユーザーがいません"
    else
      render :show
    end

  end
end
