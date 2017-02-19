class DigitalMarketingData < Expense
  validates_presence_of :company_id, :date, :amount, :search_engine
  validates :search_engine, inclusion: {in: ['google', 'bing', 'yahoo']}
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    where({date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_a_month(month, year)
    objects = objects_for_a_month(month, year)
    objects.select{||}
  end
end