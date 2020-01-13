# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

southwest = Airline.create(name: "Southwest")
american = Airline.create(name: "American")
southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
southwest_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
american_1 = american.flights.create(number: "AA1", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
southwest_1.passengers.create(name: "Harrison", age: 27)
southwest_1.passengers.create(name: "Ellyn", age: 10)
southwest_1.passengers.create(name: "Jordan", age: 50)
southwest_2.passengers.create(name: "Tom", age: 60)
american_1.passengers.create(name: "Tom", age: 60)
