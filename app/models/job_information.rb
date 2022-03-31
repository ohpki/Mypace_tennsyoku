class JobInformation < ApplicationRecord
  belongs_to :hospital
  has_many :subscriptions
  has_many :favorites

end
