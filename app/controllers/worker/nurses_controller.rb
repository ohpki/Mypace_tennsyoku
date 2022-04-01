class Worker::NursesController < ApplicationController
  before_action :authenticate_nurse!
  before_action :set_current_nurse

  def show
    @subscriptions = @nurse.subscriptions.order(created_at: :desc).page(params[:page]).per(3)
    @favorites = @nurse.favorites.order(created_at: :desc).page(params[:page]).per(3)
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
  def set_current_nurse
    @nurse = current_nurse
  end
end
