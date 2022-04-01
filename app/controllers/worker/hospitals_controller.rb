class Worker::HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @chat_room = ChatRoom.new
  end
end
