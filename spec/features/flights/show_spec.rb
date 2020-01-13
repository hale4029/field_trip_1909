require 'rails_helper'

# As a visitor
# When I visit a flights show page ('/flights/:id')
# I see all of that flights information including:
#   - number
#   - date
#   - time
#   - departure city
#   - arrival city
# And I see the name of the airline this flight belongs
# And I see the names of all of the passengers on this flight

RSpec.describe "Flights Show Page" do
  describe "I see all of that flights information" do
    it 'number, date, time, departure city, arrival city' do
      southwest = Airline.create(name: "Southwest")
      american = Airline.create(name: "American")
      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      american_1 = american.flights.create(number: "AA1", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
      passenger_1 = southwest_1.passengers.create(name: "Harrison", age: 27)
      passenger_2 = southwest_1.passengers.create(name: "Ellyn", age: 27)
      passenger_3 = american_1.passengers.create(name: "Tom", age: 60)

      visit "/flights/#{southwest_1.id}"

      expect(page).to have_content(southwest_1.airline.name)
      expect(page).to have_content(southwest_1.number)
      expect(page).to have_content(southwest_1.date)
      expect(page).to have_content(southwest_1.time)
      expect(page).to have_content(southwest_1.departure_city)
      expect(page).to have_content(southwest_1.arrival_city)

      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to_not have_content(passenger_3.name)

      expect(page).to_not have_content(american_1.number)
      expect(page).to_not have_content(american_1.date)
      expect(page).to_not have_content(american_1.time)
      expect(page).to_not have_content(american_1.departure_city)
      expect(page).to_not have_content(american_1.arrival_city)
    end
  end
end
