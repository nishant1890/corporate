class CreateRevenues < ActiveRecord::Migration[5.0]
  def change
    create_table :revenues do |t|
      t.string :company_name
      t.string :type_of_revenue
      t.string :number_of_deals
      t.integer :amount, default: 0
      t.date :date
      t.integer :company_id

      t.timestamps
    end
  end
end
