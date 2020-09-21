require 'rails_helper'

RSpec.describe "airline show page", type: :feature do

  it "can show all passengers" do
    airline_1 = Airline.create!(name: "Delta Airlines")
    flight_1 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
    flight_2 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
    passenger_1 = Passenger.create!(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", age: Faker::Number.between(from: 1, to: 90))
    passenger_2 = Passenger.create!(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", age: Faker::Number.between(from: 1, to: 90))
    passenger_3 = Passenger.create!(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", age: Faker::Number.between(from: 1, to: 90))
    flight_1.passengers << passenger_1
    flight_2.passengers << passenger_2
    flight_2.passengers << passenger_3
    visit "/airlines/#{airline_1.id}"
    expect(page).to have_content(passenger_1.name)
    expect(page).to have_content(passenger_2.name)
    expect(page).to have_content(passenger_3.name)
  end
end
