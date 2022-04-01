class Worker::FavoritesController < ApplicationController

  def create
    @job_information = JobInformation.find(params[:job_information_id])
    @favorite = @job_information.favorites.new(nurse_id: current_nurse.id)
    if @favorite.save
      redirect_to worker_job_information_path(params[:job_information_id])

    end
  end
  def destroy
    @job_information = JobInformation.find_by(params[:job_information_id])
    @favorite = Favorite.find_by(nurse_id: current_nurse.id, job_information_id: params[:job_information_id])
    @favorite.destroy
    redirect_to worker_job_information_path(params[:job_information_id])

  end
  def index
  end


end
