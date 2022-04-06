class Worker::GuestsController < ApplicationController
  def guest_sign_in
    nurse = Nurse.find_or_create_by!(first_name: 'ゲスト', last_name: '看護師', qualification: '看護師', address: '東京都', email: 'nurseguest@example.com') do |nurse|
    nurse.password = SecureRandom.urlsafe_base64
    nurse.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image-nurse.jpg')), filename: 'default-image.jpg')
  
    end
   sign_in nurse
   redirect_to worker_nurses_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
