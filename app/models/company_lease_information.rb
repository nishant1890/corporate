class CompanyLeaseInformation < ApplicationRecord
  belongs_to :company
  belongs_to :house
  validates_presence_of :start_date, :end_date

  def self.objects_for_a_month(month, year, company)
    where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month), company_id: company.id}).to_a
  end

end
