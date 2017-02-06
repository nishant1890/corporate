class CreateErpOperatingExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :erp_operating_expenses do |t|
      t.integer :paycheck, default: 0
      t.integer :insurance, default: 0
      t.integer :office, default: 0
      t.integer :utilities, default: 0
      t.integer :internet, default: 0
      t.integer :phone, default: 0
      t.integer :rt, default: 0
      t.integer :salesforce, default: 0
      t.integer :sf_admin, default: 0
      t.integer :sms_magic, default: 0
      t.integer :lindexed, default: 0
      t.date :start_date
      t.date :end_date
      t.integer :company_id

      t.timestamps
    end
  end
end
