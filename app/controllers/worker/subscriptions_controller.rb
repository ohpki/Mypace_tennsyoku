class Worker::SubscriptionsController < ApplicationController
  before_action :authenticate_nurse!

  def new
    @subscription = Subscription.new
    @job_information = params[:subscription][:job_information_id]
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      @nurse = current_nurse
      @job_information = JobInformation.find_by(id: @subscription.job_information_id)
      @subscription.create_notification_subscription(@nurse.id, @subscription.job_information_id, @job_information.hospital_id)
      redirect_to worker_job_informations_path, notice: "求人に応募しました"
    else
      redirect_back(fallback_location: root_path, notice: "応募処理に失敗しました")
    end
  end

  def index
    @subscriptions = current_nurse.subscriptions
    @job_informations = @subscriptions.job_informations.order.order(created_at: :desc).page(params[:page]).per(3)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    if @subscription.destroy
      redirect_to worker_nurses_path, notice: "応募を取り消しました"
    else
      redirect_back(fallback_location: root_path, notice: "取り消しに失敗しました")
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:job_information_id, :nurse_id)
  end
end
