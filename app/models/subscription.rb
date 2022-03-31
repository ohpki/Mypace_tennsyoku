class Subscription < ApplicationRecord
  belongs_to :nurses
  belongs_to :job_information
  has_one :notification
end
