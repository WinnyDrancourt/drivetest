class DropItineraryDestination < ActiveRecord::Migration[7.1]
  def change
    drop_table :itinerary_destinations
  end
end
