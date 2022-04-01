class Worker::HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
  end
end
