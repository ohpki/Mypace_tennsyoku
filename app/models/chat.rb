class Chat < ApplicationRecord
  belongs_to :chat_room
  belongs_to :notification, optional: true
  has_one_attached :image
  validates :message, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def create_notification_chat(nurse, contents, hospital, type)
      notification = Notification.new(
          nurse_id: nurse,
          hospital_id: hospital,
          user_type: type,
          chst_room_id: contents,
          action: 0
        )
        notification.save if notification.valid?
  end

end
