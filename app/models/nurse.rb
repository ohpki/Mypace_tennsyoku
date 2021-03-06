class Nurse < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :notifications, foreign_key: "nurse_id", class_name: "Notification", dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :qualification, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-nurse.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  

# display_name_selectがtrueならニックネームを、falseなら苗字＋名前を表示
  def display_name(nurse)
    if display_name_select == false
      nurse.first_name + last_name
    else
      if nurse.nickname.empty?
        nurse.first_name + last_name
      else
        nurse.nickname
      end
    end
  end



end
