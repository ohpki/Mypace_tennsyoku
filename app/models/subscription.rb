class Subscription < ApplicationRecord
  belongs_to :nurses, optional: true
  belongs_to :job_information
  has_one :notification
end
