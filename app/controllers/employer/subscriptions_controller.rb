class Employer::SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.where(job_information_id: params[:job_information_id]).page(params[:page]).per(10)

  end
end
