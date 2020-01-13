require 'rails_helper'

RSpec.describe "Passenger Show Page" do
  before :each do
    southwest = Airline.create(name: "Southwest")
    @american = Airline.create(name: "American")
    @southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
    @american_1 = @american.flights.create(number: "AA1", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
    @passenger_1 = @southwest_1.passengers.create(name: "Harrison", age: 27)
    @american_1.passengers << @passenger_1


  end
  it 'name and flights:' do
    visit passenger_path(@passenger_1)

    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_1.age)

    expect(page).to have_content(@american_1.number)
    expect(page).to have_content(@southwest_1.number)

    click_on(@american_1.number)
    expect(current_path).to eq(flight_path(@american_1))
end

  it "fill out new flight form" do
    @american_2 = @american.flights.create(number: "AA2", date: "12/09/19", time: "0930", departure_city: "Denver", arrival_city: "Las Vegas")
    visit passenger_path(@passenger_1)

    expect(page).to_not have_content(@american_2.number)

    fill_in :number, with: @american_2.number
    click_on('Submit')
    
    expect(current_path).to eq(passenger_path(@passenger_1))
    expect(page).to have_content(@american_2.number)
  end
end
