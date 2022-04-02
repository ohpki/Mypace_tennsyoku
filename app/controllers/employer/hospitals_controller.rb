class Employer::HospitalsController < ApplicationController
  before_action :authenticate_hospital!
  before_action :set_current_hospital


  def show
    @job_informations = @hospital.job_informations.order(created_at: :desc).page(params[:page]).per(3)
    @scouts = @hospital.scouts.order(created_at: :desc).page(params[:page]).per(3)
  end

  def edit
  end

  def update
    @hospital.update(hospital_parameters)
    if redirect_to employer_hospitals_path, notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @hospital.destroy
    redirect_to root_path, notice: "退会しました"
  end

  def quit
  end
  private
  def hospital_parameters
    params.require(:hospital).permit(:name, :postal_code, :address, :nickname, :phone_number, :Introduction, :image, :email)
  end

  def set_current_hospital
    @hospital = current_hospital
  end
end
