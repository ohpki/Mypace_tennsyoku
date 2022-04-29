class Worker::JobInformationsController < ApplicationController

  def index
    @job_information_all = JobInformation.where(job_offer_status: true)
    @job_informations = @job_information_all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @job_information = JobInformation.find(params[:id])
    if nurse_signed_in?
      @favorite = Favorite.new
      if @subscription = current_nurse.subscriptions.find_by(job_information_id: @job_information)
      else
        @subscription = Subscription.new
      end
    end
  end

  def search
    @job_informations = JobInformation.where("title LIKE?","%#{params[:word]}%")
    .or(JobInformation.where("work_style LIKE?", "%#{params[:word]}%"))
    .or(JobInformation.where("job_detail LIKE?","%#{params[:word]}%"))
    .or(JobInformation.where("address LIKE?","%#{params[:word]}%"))
    @job_information_all = @job_informations.where(job_offer_status: true)
    @job_informations = @job_information_all.order(created_at: :desc).page(params[:page]).per(10)
    render :index
  end

end
