class Hospital < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  has_many :job_informations, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :notifications
  has_many :chat_rooms, dependent: :destroy

  def display_job_offer_status(status)
    if status == true
      "公開中"
    else
      "非公開"
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-hospital.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
