class ChatRoom < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :nurse
  belongs_to :hospital

end
