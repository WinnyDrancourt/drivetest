class UpdatingDestinationTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :destinations, :latitude, :float
    remove_column :destinations, :longitude, :float
    add_column :destinations, :staying_time, :integer
    add_column :destinations, :notes, :text
    remove_column :itineraries, :notes, :text
  end
end
