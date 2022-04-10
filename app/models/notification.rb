class Notification < ApplicationRecord
  has_one :chat
  has_one :scout
  has_one :subscription

  enum action: { chat: 0, subscription: 1, scout: 2 }
  
def notification_update(notification_id)
  notification = Notification.find(notification_id)
  notification.checked = true
  notification.save

end
end
