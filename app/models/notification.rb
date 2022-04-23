class Notification < ApplicationRecord
  has_one :chat
  has_one :scout
  belongs_to :job_information, optional: true

  enum action: { chat: 0, subscription: 1, scout: 2 }

  def notification_update
    self.checked = true
    save
  end
end
