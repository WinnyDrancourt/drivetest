class RemoveLatitudeLongitudeFromUserTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :latitude, :string
    remove_column :users, :longitude, :string
  end
end
