class ChatRoomsController < ApplicationController

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.rejection = 0
    @chat_room.save
    redirect_to chat_room_chats_path(@chat_room)
  end

  def update
    @chat_room = ChatRoom.find(params[:id])
    # @chat_room.rejection = params[:chat_room][:rejection]
    @chat_room.update(rejection: params[:chat_room][:rejection])
    redirect_to chat_room_chats_path(@chat_room)
  end



  private
  def chat_room_params
    params.require(:chat_room).permit(:hospital_id, :nurse_id, :rejection)
  end
end
