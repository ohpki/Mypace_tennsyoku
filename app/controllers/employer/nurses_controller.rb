class Employer::NursesController < ApplicationController
  before_action :authenticate_hospital!

  def show
    @nurse = Nurse.find(params[:id])
    @scout = Scout.new
  end

  def index
    @nurses = Nurse.where(job_seeking_status: true).order(created_at: :desc).page(params[:page]).per(10)

  end
end
