class Employer::GuestsController < ApplicationController
  def guest_sign_in
    hospital = Hospital.find_or_create_by!(name: 'ゲスト病院', email: 'hospitalguest@example.com') do |hospital|
    hospital.password = SecureRandom.urlsafe_base64
    hospital.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image-hospital.jpg')), filename: 'default-image.jpg')
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
   sign_in hospital
   redirect_to employer_hospitals_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
