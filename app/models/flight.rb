class Flight <ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city
  validates :number, uniqueness: true, presence: true
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.look_up_flight(number)
    where(number: number).first
  end

  def number_of_adults
    self.passengers.where('age > 17').count
  end

  def number_of_minors
    self.passengers.where('age < 18').count
  end
end
