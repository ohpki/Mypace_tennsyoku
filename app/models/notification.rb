class Notification < ApplicationRecord
  has_one :chat_room
  has_one :scout
  has_one :subscription

  enum action: { chat: 0, subscription: 1, scout: 2 }
  
end
