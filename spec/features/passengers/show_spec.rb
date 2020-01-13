require 'rails_helper'

RSpec.describe "Passenger Show Page" do
  describe "I see that person's information and flights" do
    it 'name and flights:' do
      southwest = Airline.create(name: "Southwest")
      american = Airline.create(name: "American")
      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      american_1 = american.flights.create(number: "AA1", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
      passenger_1 = southwest_1.passengers.create(name: "Harrison", age: 27)
      passenger_1 << american_1

      visit "/passengers/#{passenger_1.id}"

      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_1.age)

      expect(page).to have_content(american_1.number)
      expect(page).to have_content(southwest_1.number)
    end
  end
end
