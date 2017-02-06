class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :company_id
      t.text :address

      t.timestamps
    end
  end
end
