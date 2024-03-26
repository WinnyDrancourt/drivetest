require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = User.create(
    first_name: "John", 
    last_name: "Doe", 
    zipcode: "93100", 
    city: "Montreuil", 
    email: "johndoe@gmail.com", 
    password: "123446")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#password" do
      it "should not be valid without a 6 chars min password" do
        user = User.create(
          first_name: "John", 
          last_name: "Doe", 
          zipcode: "93100", 
          city: "Montreuil", 
          email: "johndoe@gmail.com", 
          password: "1236")
        expect(user).not_to be_valid
        expect(user.errors.include?(:password)).to eq(true)
      end
    end

    describe "#email" do
      it "should not be valid without email" do
        user = User.create(
          first_name: "John", 
          last_name: "Doe", 
          zipcode: "93100", 
          city: "Montreuil", 
          email: "",
          password: "123456")
        expect(user).not_to be_valid
      end
    end

    describe "good user" do
      it "should be validated if first_name, last_name, zipcode, city exist and if email is unique" do
        user = User.create(
          first_name: "John", 
          last_name: "Doe", 
          zipcode: "93100", 
          city: "Montreuil", 
          email: "johndoe1@gmail.com",
          password: "123456")
        expect(user).to be_valid
      end
    end
  end

  context "associations" do

    describe "itineraries" do
      it "should have many itineraries" do
        itinerary = Itinerary.create(user: @user)
        expect(@user.itineraries.include?(itinerary)).to eq(true)
      end
    end
  end
end
