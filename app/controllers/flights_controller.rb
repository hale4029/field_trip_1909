class FlightsController <ApplicationController

  def show
    @flight = Flight.find(params[:id])
  end

  def create
    passenger = Passenger.find(params[:passenger_id])
    flight = Flight.look_up_flight(params[:number])
    passenger.flights << flight
    redirect_to passenger_path(passenger)
  end

end
