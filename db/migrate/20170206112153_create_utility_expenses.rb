class CreateUtilityExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :utility_expenses do |t|
      t.integer :cable, default: 0
      t.integer :gas, default: 0
      t.integer :electric, default: 0
      t.integer :water, default: 0
      t.integer :food, default: 0
      t.integer :yoga, default: 0
      t.integer :acupunture, default: 0
      t.integer :auto, default: 0
      t.integer :fuel, default: 0
      t.integer :landscaping, default: 0
      t.integer :cleaning, default: 0
      t.integer :total_per_house, default: 0
      t.date :start_date
      t.date :end_date
      t.integer :company_id

      t.timestamps
    end
  end
end
