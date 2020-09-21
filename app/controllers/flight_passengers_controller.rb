class FlightPassengersController < ApplicationController

  def destroy
    FlightPassenger.where(passenger_id: params[:passenger_id]).where(flight_id: params[:flight_id]).first.destroy
    redirect_to "/flights"
  end

end
