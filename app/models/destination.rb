class Destination < ApplicationRecord
  belongs_to :itinerary
  accepts_nested_attributes_for :itinerary
  validates :city, presence: true
end
