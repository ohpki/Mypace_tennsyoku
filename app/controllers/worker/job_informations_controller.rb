class Worker::JobInformationsController < ApplicationController
  def index
    @job_informations = JobInformation.where(job_offer_status: true).order(created_at: :desc).page(params[:page]).per(10)
  end
  def show
    @job_information = JobInformation.find(params[:id])
    if @subscription = current_nurse.subscriptions.find_by(job_information_id: @job_information)
    else
      @subscription = Subscription.new
    end
  end
end
