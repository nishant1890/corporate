class CreateCompanyLeaseInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :company_lease_informations do |t|
      t.string :company_id
      t.string :house_id
      t.string :start_date
      t.string :end_date
      t.string :total_lease_amount

      t.timestamps
    end
  end
end
