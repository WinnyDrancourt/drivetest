class Destination < ApplicationRecord
    belongs_to :itinerary
    validates :city, presence: true
end
