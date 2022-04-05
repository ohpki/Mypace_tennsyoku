class JobInformation < ApplicationRecord
  belongs_to :hospital
  has_many :subscriptions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :work_style, presence: true, length: { maximum: 40 }
  validates :alarys, presence: true, length: { maximum: 20 }

end
