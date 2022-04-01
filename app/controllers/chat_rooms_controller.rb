class ChatRoomsController < ApplicationController
  def show
  end

  def index
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.save
    redirect_to new_chat_path
  end


  private
  def chat_room_params
    params.require(:chat_room).permit(:hospital_id, :nurse_id)
  end
end
