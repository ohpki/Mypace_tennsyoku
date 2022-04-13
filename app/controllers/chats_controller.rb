class ChatsController < ApplicationController

  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    if @chat_room.nurse_id == current_nurse.id || @chat_room.hospital_id == current_hospital.id
      @chats = Chat.where(chat_room_id: @chat_room.id)
      @chat = Chat.new
    else
      redirect_to root_path
    end
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.chat_room_id = params[:chat_room_id]
    if @chat.save
      @chat_room = ChatRoom.find_by(id: @chat.chat_room_id)
      nurse_id = @chat_room.nurse_id
      hospital_id = @chat_room.hospital_id
      @chats = Chat.where(chat_room_id: @chat_room.id)
      # 通知の受信者が看護師ならuser_type=trueに、病院ならfalseに
      if nurse_signed_in?
        user_type = false
      elsif hospital_signed_in?
        user_type = true
      end
    end
        @chat.create_notification_chat(nurse_id, @chat.chat_room_id, hospital_id, user_type)
        @chat_room = ChatRoom.find(params[:chat_room_id])
        @chats = Chat.where(chat_room_id: @chat_room.id)
  end

  private

  def chat_params
    params.require(:chat).permit(:sender, :message, :chat_room_id, :image)
  end
end
