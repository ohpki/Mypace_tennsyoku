class ChatRoomsController < ApplicationController
  
  def create
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.save
    redirect_to chat_room_chats_path(@chat_room)
  end


  private
  def chat_room_params
    params.require(:chat_room).permit(:hospital_id, :nurse_id)
  end
end
