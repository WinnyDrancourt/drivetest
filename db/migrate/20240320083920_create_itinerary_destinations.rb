class CreateItineraryDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_destinations do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.timestamps
    end
  end
end
