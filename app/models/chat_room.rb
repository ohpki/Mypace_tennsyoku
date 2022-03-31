class ChatRoom < ApplicationRecord
  has_many :chats
  belongs_to :nurse
  belongs_to :hospital
  has_one :notification
end
