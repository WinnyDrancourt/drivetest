class Addindextolike < ActiveRecord::Migration[7.1]
  def change
    add_index :likes, %i[user_id itinerary_id], unique: true
  end
end
