class Notification < ApplicationRecord
  has_one :chat_room
  has_one :scout
  has_one :subscription
end
