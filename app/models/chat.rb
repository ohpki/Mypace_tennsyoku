class Chat < ApplicationRecord
  belongs_to :chat_room
  belongs_to :notification, optional: true
  has_one_attached :image
  validates :message, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def create_notification_chat(myself, contents, you, nurse, hospital)
    # メッセージの送信者である自分が看護師だったらsenderとnurse_idに自分のidを保存
    # 通知の受信者が病院の場合はuser_type=falseにする
    if nurse
      notification = Notification.new(
          sender: myself,
          recipient: you,
          user_type: false,
          chst_room_id: contents,
          action: 0
        )
        notification.save if notification.valid?
     # メッセージの送信者である自分が病院だったらsenderとhospital_idに自分のidを保存
     # 通知の受信者が看護師の場合はuser_type=trueにする
    elsif hospital
      notification = Notification.new(
          sender: myself,
          recipient: you,
          user_type: true,
          chst_room_id: contents,
          action: 0
        )
        notification.save if notification.valid?
    end
  end

end
