class CreateMarketingFixedExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :marketing_fixed_expenses do |t|
      t.integer :southwest, default: 0
      t.integer :west_coast, default: 0
      t.integer :midwest, default: 0
      t.integer :new_england, default: 0
      t.integer :south_east, default: 0
      t.integer :sober_recover, default: 0
      t.integer :easy_breeze, default: 0
      t.integer :addiction_advisor, default: 0
      t.integer :visible, default: 0
      t.integer :air_time, default: 0
      t.integer :rehabs_hq, default: 0
      t.integer :drug_use_today, default: 0
      t.integer :facebook, default: 0
      t.date :start_date
      t.date :end_date
      t.integer :company_id

      t.timestamps
    end
  end
end
