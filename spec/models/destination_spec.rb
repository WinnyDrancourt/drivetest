require 'rails_helper'

RSpec.describe Destination, type: :model do
  before(:each) do 
    @user = User.create(
    pseudo: "Raynor", 
    email: "johndoe@gmail.com", 
    password: "123446")

    @itinerary = Itinerary.create(
    title: "Roadtrip",
    start_date: Date.today,
    end_date: Date.tomorrow,
    user: @user
    )

    @destination = Destination.create(
    city: "Paris",
    staying_time: 3
    )
  end

  context "validations" do
    it "can be created without any mandatory attribute but must belongs to itinerary" do
      destination = Destination.create()
      expect(destination).not_to be_valid
      destination = Destination.create(itinerary: @itinerary)
      expect(destination).to be_valid
    end
  end
end
