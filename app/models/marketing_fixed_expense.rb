class MarketingFixedExpense < ApplicationRecord
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end
end
