class Scout < ApplicationRecord
  belongs_to :nurse
  belongs_to :hospital
  has_one :notification
end
