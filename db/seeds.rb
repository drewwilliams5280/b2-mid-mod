# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FlightPassenger.destroy_all
Flight.destroy_all
Passenger.destroy_all
Airline.destroy_all

Airline.create!(name: "Delta Airlines")
Airline.create!(name: "United Airlines")
Airline.create!(name: "Southwest Airlines")
Airline.create!(name: "American Airlines")

20.times do
  airline = Airline.all.sample
  Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline)
end

80.times do
  passenger = Passenger.create!(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", age: Faker::Number.between(from: 1, to: 90))
  Flight.all.sample.passengers << passenger
end
