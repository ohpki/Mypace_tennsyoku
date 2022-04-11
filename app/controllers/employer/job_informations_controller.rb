class Employer::JobInformationsController < ApplicationController
  def new
    @job_information = JobInformation.new
    @hospital = current_hospital
  end

  def create
    @job_information = JobInformation.new(job_information_params)
    @job_information.hospital_id = current_hospital.id
    if @job_information.save
      redirect_to employer_job_information_path(@job_information)
    else
      @hospital = current_hospital
      render :new
    end
  end

  def index
    @job_informations = current_hospital.job_informations
  end

  def show
    @job_information = JobInformation.find(params[:id])

  end

  def edit
    @job_information = JobInformation.find(params[:id])
    @hospital = current_hospital
  end

  def update
    @job_information = JobInformation.find(params[:id])
    if @job_information.update(job_information_params)
      redirect_to employer_job_information_path(@job_information), notice: "求人情報が更新されました"
    else
      @hospital = current_hospital
      render :edit
    end

  end

  def destroy
    @job_information = JobInformation.find(params[:id])
    @job_information.destroy
    redirect_to employer_hospitals_path, notice: "求人情報は消去されました"

  end
  private

  def job_information_params
    params.require(:job_information).permit(:title, :work_style, :alarys, :hospital_name, :image, :address, :job_offer_status, :job_detail)
  end
end
