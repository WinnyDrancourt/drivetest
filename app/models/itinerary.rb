class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :destinations
  accepts_nested_attributes_for :destinations
  has_many :likes
end
