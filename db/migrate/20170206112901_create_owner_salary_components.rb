class CreateOwnerSalaryComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :owner_salary_components do |t|
      t.integer :owner_salary, default: 0
      t.integer :owner_commission, default: 0
      t.integer :spouse_salary, default: 0
      t.integer :spouse_commission, default: 0
      t.date :start_date
      t.date :end_date
      t.integer :company_id

      t.timestamps
    end
  end
end
