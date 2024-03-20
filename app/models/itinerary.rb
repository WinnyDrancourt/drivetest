class Itinerary < ApplicationRecord
    belongs_to :user
    has_many :itinerary_destinations
    has_many :destinations, through: :itinerary_destinations
    has_many :likes
end
