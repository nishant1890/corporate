class DigitalMarketingData < Expense
  validates_presence_of :company_id, :date, :amount, :search_engine
  validates :search_engine, inclusion: {in: ['google', 'bing', 'yahoo']}
  belongs_to :company
end