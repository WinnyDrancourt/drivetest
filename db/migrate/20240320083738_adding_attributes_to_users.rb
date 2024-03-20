class AddingAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :zipcode, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
