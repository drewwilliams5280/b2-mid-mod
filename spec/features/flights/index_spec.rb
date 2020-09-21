require 'rails_helper'

RSpec.describe "flights index page", type: :feature do

  it "can show flight numbers" do
    airline_1 = Airline.create!(name: "Delta Airlines")
    flight_1 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
    flight_2 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
    visit "/flights"
    expect(page).to have_content(flight_1.number)
    expect(page).to have_content(flight_2.number)
  end
end
