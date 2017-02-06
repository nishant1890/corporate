class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :company_name
      t.date :date
      t.string :amount
      t.string :payroll_type
      t.string :search_engine
      t.string :month
      t.string :year
      t.string :miscellaneous_expense_type
      t.integer :company_id
      t.timestamps
    end
  end
end
