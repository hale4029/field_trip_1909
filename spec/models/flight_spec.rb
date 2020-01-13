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
    it "look_up_flight by flight :number" do
      southwest = Airline.create(name: "Southwest")
      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")

      result = Flight.look_up_flight(southwest_1.number)
      expect(result).to eq(southwest_1)
    end
  end


end
