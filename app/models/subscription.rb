class Subscription < ApplicationRecord
  has_many :nurses
  belongs_to :job_information
  has_one :notification
end
