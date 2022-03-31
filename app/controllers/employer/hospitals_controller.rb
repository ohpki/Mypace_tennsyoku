class Employer::HospitalsController < ApplicationController
  def show
    @hospital = current_hospital
    @job_informations = @hospital.job_informations
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def quit
  end
end
