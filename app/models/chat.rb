class Chat < ApplicationRecord
  belongs_to :chat_room
  belongs_to :notification, optional: true
  has_one_attached :image
  validates :message, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-nurse.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def create_notification_chat(myself, contents, you, nurse, hospital)
    # メッセージの送信者である自分が看護師だったらsenderとnurse_idに自分のidを保存
    if nurse
      notification = Notification.new(
          sender: myself,
          nurse_id: myself,
          recipient: you,
          chst_room_id: contents,
          action: 0
        )
        notification.save if notification.valid?
     # メッセージの送信者である自分が病院だったらsenderとhospital_idに自分のidを保存
    elsif hospital
      notification = Notification.new(
          sender: myself,
          hospital_id: myself,
          recipient: you,
          chst_room_id: contents,
          action: 0
        )
        notification.save if notification.valid?
    end
  end

end
