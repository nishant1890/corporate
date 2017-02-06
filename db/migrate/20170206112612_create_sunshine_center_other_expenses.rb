class CreateSunshineCenterOtherExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :sunshine_center_other_expenses do |t|
      t.integer :hosting, default: 0
      t.integer :blogging, default: 0
      t.integer :facebook, default: 0
      t.integer :liability_insurance, default: 0
      t.integer :heath_insurance, default: 0
      t.integer :detox, default: 0
      t.integer :workers_compensation, default: 0
      t.integer :fica, default: 0
      t.integer :office_supplies, default: 0
      t.integer :cort, default: 0
      t.integer :kipu, default: 0
      t.integer :miscellaneous, default: 0
      t.date :start_date
      t.date :end_date
      t.integer :company_id

      t.timestamps
    end
  end
end
