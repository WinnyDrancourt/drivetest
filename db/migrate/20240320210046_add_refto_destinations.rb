class AddReftoDestinations < ActiveRecord::Migration[7.1]
  def change
    add_reference :destinations, :itinerary, foreign_key: true, index: true
  end
end
