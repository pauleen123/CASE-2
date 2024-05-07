class RoomsController < ApplicationController
  
  def index
  end
  
  skip_before_action :verify_authenticity_token

  def create
    room_params = params[:room]
    @room = Room.new(room_params)

    if @room.save
      render xml: @room, status: :created
    else
      render xml: @room.errors, status: :unprocessable_entity
    end
  end
end
