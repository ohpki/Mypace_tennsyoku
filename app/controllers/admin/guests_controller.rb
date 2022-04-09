class Admin::GuestsController < ApplicationController
  def guest_sign_in
    admin = Admin.find_or_create_by!(email: "adminsample2@ewample.com") do |admin|
    admin.password = SecureRandom.urlsafe_base64
    end
   sign_in admin
   redirect_to admin_nurses_path, notice: '管理者ゲストユーザーとしてログインしました。'
  end
end
