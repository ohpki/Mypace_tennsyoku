class Worker::HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    if nurse_signed_in?
      @chat_room = ChatRoom.new
    end
  end
end
