class FlightPassenger < ApplicationRecord
  validates_presence_of :flight_id, :passenger_id
  belongs_to :passenger
  belongs_to :flight
end
