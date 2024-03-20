class Destination < ApplicationRecord
    has_many :itinerary_destinations
    has_many :itineraries, through: :itinerary_destinations
    validates :city, presence: true
end
