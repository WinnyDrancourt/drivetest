class ItineraryDestination < ApplicationRecord
    belongs_to :itinerary
    belongs_to :destination
end
