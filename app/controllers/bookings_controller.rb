class BookingsController < ApplicationController
  def index
  end

  skip_before_action :verify_authenticity_token

  def create
    booking_params = params[:booking]
    @booking = Booking.new(booking_params)

    if @booking.save
      render xml: @booking, status: :created
    else
      render xml: @booking.errors, status: :unprocessable_entity
    end
  end

end
