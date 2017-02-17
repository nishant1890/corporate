class AddHouseNumberToHouses < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :house_number, :string
  end
end
