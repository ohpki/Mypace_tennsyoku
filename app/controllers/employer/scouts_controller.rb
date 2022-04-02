class Employer::ScoutsController < ApplicationController
before_action :authenticate_hospital!

  def create
    @nurse = Nurse.find(params[:nurse_id])
    @scout = @nurse.scouts.new(hospital_id: current_hospital.id)
    @scout.save
    redirect_to employer_nurse_path(params[:nurse_id])
  end

  def destroy
    @nurse = Nurse.find(params[:nurse_id])
    @scout = current_hospital.scouts.find_by(nurse_id: params[:nurse_id])

    @scout.destroy
    redirect_to employer_nurse_path(params[:nurse_id])
  end


end
