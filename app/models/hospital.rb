class Hospital < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  has_many :job_informations, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :notifications, foreign_key: "hospital_id", class_name: "Notification", dependent: :destroy
  has_many :chat_rooms, dependent: :destroy


  validates :name, presence: true, length: { maximum: 40 }
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true, length: { maximum: 30 }
  validates :phone_number, presence: true, length: { in: 10..11 }


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
    image.variant(resize_to_limit: [width, height]).processed
  end
end
