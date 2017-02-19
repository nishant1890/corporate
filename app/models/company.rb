class Company < ApplicationRecord
  validates_presence_of :name
    
  validates :contact, length: {minimum: 9, maximum: 9}

  has_many :revenues
  has_many :houses
    
  def marketing_expense_for_month(month, year)
    digital_marketing_expenses = DigitalMarketingData.objects_for_a_month(month, year, self).map{|e| e.amount.to_i}.sum
    fixed_marketing_expenses = MarketingFixedExpense.objects_for_a_month(month, year, self).each_with_object([]) do |e, a|
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
    digital_marketing_expenses + fixed_marketing_expenses
  end

  def marketing_per_cw_for_month(month, year)
    marketing_expenses = marketing_expense_for_month(month, year)
    close_won_deals = Revenue.close_down_deals_count(self, month, year)
    if close_won_deals == 0
      0.0
    else
      marketing_expenses / close_won_deals
    end
  end

  def expenses_for_month(month, year)
    lease_amount = CompanyLeaseInformation.objects_for_a_month(month, year, self).map{|l| l.total_lease_amount.to_i}.sum
    sc_other_expenses = SunshineCenterOtherExpense.expenses_for_month(month, year, self)
    houses_count = self.houses.count
    sc_utility_expenses = UtilityExpense.expenses_for_month(month, year, self)
    revenue = Revenue.revenue_for_a_month(self, month, year)
    payroll_expenses = PayrollData.expenses_for_month(month, year, self)
    expenses = (lease_amount + (sc_utility_expenses * houses_count) + sc_other_expenses + payroll_expenses) + (revenue.to_f * 0.25)
  end

  def marketing_roi(month, year)
    revenue = Revenue.revenue_for_a_month(self, month, year)
    marketing_total = self.marketing_expense_for_month(month, year)
    if marketing_total == 0
      0.0
    else
      (revenue.to_f / marketing_total.to_f).round(2)
    end  
  end
end
