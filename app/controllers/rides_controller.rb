class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.save
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end