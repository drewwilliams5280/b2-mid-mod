require 'rails_helper'

describe Passenger, type: :model do

  describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :age }
    end

  describe 'relationships' do
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end

  describe 'instance methods' do
    it "can cound flights for a passenger" do
      airline_1 = Airline.create!(name: "Delta Airlines")
      flight_1 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
      flight_2 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
      flight_3 = Flight.create!(number: Faker::Number.between(from: 1000, to: 99999), airline: airline_1)
      passenger_1 = Passenger.create!(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", age: Faker::Number.between(from: 1, to: 90))
      flight_1.passengers << passenger_1
      flight_2.passengers << passenger_1
      flight_3.passengers << passenger_1
      expect(passenger_1.number_of_flights).to eq(3)
    end
  end

end
