require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
    it {should validate_uniqueness_of :number}
  end
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "model methods" do
    before :each do
      southwest = Airline.create(name: "Southwest")
      @southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      @passenger_1 = @southwest_1.passengers.create(name: "Harrison", age: 27)
      @passenger_2 = @southwest_1.passengers.create(name: "Ellyn", age: 10)
      @passenger_3 = @southwest_1.passengers.create(name: "Tom", age: 60)
    end
    it "look_up_flight by flight :number" do
      result = Flight.look_up_flight(@southwest_1.number)
      expect(result).to eq(@southwest_1)
    end

    it "count adults on flight" do
      result = @southwest_1.number_of_adults
      expect(result).to eq(2)
    end

    it "count minors on flight" do
      result = @southwest_1.number_of_minors
      expect(result).to eq(1)
    end
  end


end
