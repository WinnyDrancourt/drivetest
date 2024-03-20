class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes
      t.belongs_to :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
