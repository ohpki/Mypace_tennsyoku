class Worker::NursesController < ApplicationController
  before_action :authenticate_nurse!
  before_action :set_current_nurse
  before_action :use_name_for_nickname

  def use_name_for_nickname
  if @nurse.nickname.nil?
    @nurse.nickname = @nurse.first_name
  end
  end

  def show
    @subscriptions = @nurse.subscriptions.order(created_at: :desc).page(params[:page]).per(3)
    @favorites = @nurse.favorites.order(created_at: :desc).page(params[:page]).per(3)
    @chat_rooms = current_nurse.chat_rooms.order(created_at: :desc).page(params[:page]).per(3)
  end
  def edit

  end
  def update

    @nurse.save(nurse_params)
    redirect_to worker_nurses_path, notice: "プロフィールを変更しました"

  end
  def destroy
    @nurse.destroy
    redirect_to root_path, notice: "退会しました"
  end

  private
  def set_current_nurse
    @nurse = current_nurse
  end

  def nurse_params
    params.require(:nurse).permit(:display_name_select, :first_name, :last_name, :first_name_kana, :last_name_kana, :image, :job_detail, :qualification, :select_name, :Introduction, :image)
  end


end
