class JobInformation < ApplicationRecord
  belongs_to :hospital
  has_many :subscriptions, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
