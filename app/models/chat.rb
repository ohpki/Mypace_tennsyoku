class Chat < ApplicationRecord
  belongs_to :chat_room
  def create_notification_chat(myself, contents, you)
        notification = Notification.new(
          sender: myself,
          recipient: you,
          chst_room_id: contents,
          action: 0
        )
        notification.save if notification.valid?
  end

  validates :message, presence: true

end
