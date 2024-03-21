class Destination < ApplicationRecord
    belongs_to :itinerary
    validates :city, presence: true
    validates :staying_time, presence: true
end
