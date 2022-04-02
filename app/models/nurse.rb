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

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-nurse.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  def nickname_or_name_display
    
  end

  def full_name_display
    self.first_name + self.last_name
  end
end
