class MarketingFixedExpense < ApplicationRecord
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_month(month, year, company)
    fixed_marketing_expenses = MarketingFixedExpense.objects_for_a_month(month, year, company).each_with_object([]) do |e, a|
      a << e.southwest.try(:to_i)
      a << e.west_coast.try(:to_i)
      a << e.midwest.try(:to_i)
      a << e.new_england.try(:to_i)
      a << e.south_east.try(:to_i)
      a << e.sober_recover.try(:to_i)
      a << e.easy_breeze.try(:to_i)
      a << e.addiction_advisor.try(:to_i)
      a << e.visible.try(:to_i)
      a << e.air_time.try(:to_i)
      a << e.rehabs_hq.try(:to_i)
      a << e.drug_use_today.try(:to_i)
      a << e.facebook.try(:to_i)
    end.reject{|a| a.nil?}.sum.to_f
  end
end
