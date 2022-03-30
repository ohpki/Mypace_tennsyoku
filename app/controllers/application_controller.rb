class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    worker_job_informations_path
  end
end
