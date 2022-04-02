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
    redirect_to chat_room_chats_path(params[:chat_room_id])
  end

  private

  def chat_params
    params.require(:chat).permit(:sender, :message, :chat_room_id)
  end
end
