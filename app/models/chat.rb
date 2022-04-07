class Chat < ApplicationRecord
  belongs_to :chat_room
  belongs_to :notification, optional: true
  validates :message, presence: true

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
