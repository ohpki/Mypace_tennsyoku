class ChatsController < ApplicationController

  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chats = Chat.where(chat_room_id: @chat_room.id)
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.chat_room_id = params[:chat_room_id]
    @chat.save
    @chat_room = ChatRoom.find_by(id: @chat.chat_room_id)

    # メッセージ送信した自分が看護師だった場合、メッセージ送信者は自分(看護師)、受診者は病院
    # メッセージ送信した自分が病院だった場合、メッセージ送信者は自分(病院)、受診者は看護師
    # で通知を作成する
    if nurse_signed_in?
      myself = current_nurse.id
      you = @chat_room.hospital_id
    elsif hospital_signed_in?
      myself = current_hospital.id
      you = @chat_room.nurse_id
    end
    @chat.create_notification_chat(myself, @chat.chat_room_id, you)
    redirect_to chat_room_chats_path(params[:chat_room_id])
  end

  private

  def chat_params
    params.require(:chat).permit(:sender, :message, :chat_room_id)
  end
end
