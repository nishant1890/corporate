class Revenue < ApplicationRecord
  belongs_to :company
  validates :type_of_revenue, inclusion: {in: ['Cash', 'Insurance Payout', 'Refund', 'ERP', 'Early Checkout']}

  def self.revenue_objects_for_a_month(month, year, company)
    Revenue.where({date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month), company_id: company.id}).to_a
  end

  def self.revenue_for_a_month(company, month, year)
    revenue_objects =  revenue_objects_for_a_month(month, year, company)
    revenue_objects.select{|r| ['Cash', 'Insurance Payout'].include?(r.type_of_revenue)}.map(&:amount).sum.to_f
  end

  def self.close_down_deals_count(company, month, year)
    revenue_objects =  revenue_objects_for_a_month(month, year, company)
    revenue_objects.map{|r| r.number_of_deals.to_i}.sum
  end 
end
