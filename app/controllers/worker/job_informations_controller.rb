class Worker::JobInformationsController < ApplicationController
  def index
    @job_informations = JobInformation.where(job_offer_status: true).order(created_at: :desc).page(params[:page]).per(10)
  end
  def show
    @job_information = JobInformation.find(params[:id])
    @favorite = Favorite.new
    if @subscription = current_nurse.subscriptions.find_by(job_information_id: @job_information)
    else
      @subscription = Subscription.new
    end
  end
  def search
    @job_informations = JobInformation.where("title LIKE?","%#{params[:word]}%")
    .or(JobInformation.where("work_style LIKE?", "%#{params[:word]}%"))
    .or(JobInformation.where("job_detail LIKE?","%#{params[:word]}%"))
    .or(JobInformation.where("address LIKE?","%#{params[:word]}%"))
    @job_informations = @job_informations.where(job_offer_status: true).order(created_at: :desc).page(params[:page]).per(10)
    render :index
  end

end
