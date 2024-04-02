class Destination < ApplicationRecord
  belongs_to :itinerary
  accepts_nested_attributes_for :itinerary

  after_destroy :delete_itinerary_if_last_destination

  private

  def delete_itinerary_if_last_destination
    itinerary.destroy if itinerary.destinations.empty?
  end
end
