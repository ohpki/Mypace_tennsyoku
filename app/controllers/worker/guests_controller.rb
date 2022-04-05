class Worker::GuestsController < ApplicationController
  def guest_sign_in
    nurse = Nurse.find_or_create_by!(first_name: 'ゲスト', last_name: '看護師', email: 'nurseguest@example.com') do |nurse|
    nurse.password = SecureRandom.urlsafe_base64
    nurse.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image-nurse.jpg')), filename: 'default-image.jpg')
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
   sign_in nurse
   redirect_to worker_nurses_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
