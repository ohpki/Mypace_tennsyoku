class ChatRoom < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :nurse
  belongs_to :hospital

  enum rejection: { allow_messages: 0, nurse_rejection: 1, hospital_rejection: 2 }


end
