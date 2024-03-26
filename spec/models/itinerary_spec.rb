require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  before(:each) do 
    @user = User.create(
    first_name: "John", 
    last_name: "Doe", 
    zipcode: "93100", 
    city: "Montreuil", 
    email: "johndoe@gmail.com", 
    password: "123446")

    @itinerary = Itinerary.create(
    title: "Roadtrip",
    start_date: Date.today,
    end_date: Date.tomorrow,
    user: @user
    )
  end

  context "validations" do
    it "should not be created without being associated to a user" do
      bad_itinerary = Itinerary.create(
      title: "Roadtrip",
      start_date: Date.today,
      end_date: ""
      )
      expect(bad_itinerary).not_to be_valid
    end
  end

  context "public instance methods" do
    describe "total_staying_time method" do
      it "shoud return the sum of the destinations staying time (integer) associated with the itinerary" do
        expect(@itinerary.total_staying_time).to eq(0)
        destination1 = Destination.create(city: "RandomCity", staying_time: 2, itinerary: @itinerary)
        destination2 = Destination.create(city: "RandomTown", staying_time: 5, itinerary: @itinerary)
        expect(@itinerary.total_staying_time).to eq(7)
      end
    end
  end
end
