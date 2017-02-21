class Company < ApplicationRecord
  validates_presence_of :name
    
  validates :contact, length: {minimum: 10, maximum: 10}
  has_and_belongs_to_many :users
  has_many :revenues
  has_many :houses
    
  def marketing_expense_for_month(month, year)
    digital_marketing_expenses = DigitalMarketingData.objects_for_a_month(month, year, self).map{|e| e.amount.to_i}.sum
    fixed_marketing_expenses = MarketingFixedExpense.expenses_for_month(month, year, self)
    digital_marketing_expenses + fixed_marketing_expenses
  end

  def marketing_per_cw_for_month(month, year)
    marketing_expenses = marketing_expense_for_month(month, year)
    close_won_deals = Revenue.close_down_deals_count(self, month, year)
    if close_won_deals == 0
      0.0
    else
      (marketing_expenses / close_won_deals).round(2)
    end
  end

  def non_erp_expenses_for_month(month, year)
    lease_amount = CompanyLeaseInformation.objects_for_a_month(month, year, self).map{|l| l.total_lease_amount.to_i}.sum
    sc_other_expenses = SunshineCenterOtherExpense.expenses_for_month(month, year, self)
    houses_count = self.houses.count
    clients_count = Revenue.close_down_deals_count(self, month, year) 
    sc_utility_expenses = UtilityExpense.expenses_for_month(month, year, self)
    revenue = Revenue.revenue_for_a_month(self, month, year)
    payroll_expenses = PayrollData.expenses_for_month(month, year, self)
    expenses = (lease_amount + (sc_utility_expenses * houses_count) + sc_other_expenses + payroll_expenses) + (revenue.to_f * 0.25)
  end

  def non_erp_payroll_expenses_for_month(month, year)
    PayrollData.expenses_for_month(month, year, self)
  end

  def marketing_roi(month, year)
    revenue = self.revenue_for_month(year, month)
    marketing_total = self.marketing_expense_for_month(month, year)
    if marketing_total == 0
      0.0
    else
      (revenue.to_f / marketing_total.to_f).round(2)
    end  
  end

  def erp_employee_payroll_expenses_for_month(month, year)
    erp_payroll_expenses = PayrollData.expenses_for_month(month, year, self)
    erp_payroll_expenses - (((OwnerSalaryComponent.owner_salary_for_month(month, year, self) * 26 ) / 12 + OwnerSalaryComponent.owner_commission_for_month(month, year, self) ) * 2) + (((OwnerSalaryComponent.spouse_salary_for_month(month, year, self) * 26 ) / 12 + OwnerSalaryComponent.spouse_commission_for_month(month, year, self) ) * 2)
  end

  def erp_revenue_for_month(month, year)
    Revenue.revenue_for_a_month(self, month, year) + (0.25 * Revenue.revenue_for_a_month(Company.find_by(name: 'Monarch Shores'), month, year)) +  (0.25 * Revenue.revenue_for_a_month(Company.find_by(name: 'Willow Springs Recovery'), month, year)) + (0.25 * Revenue.revenue_for_a_month(Company.find_by(name: 'Chapters Capistrano'), month, year))
  end

  def erp_expenses_for_month(month, year)
    digital_marketing_expenses = DigitalMarketingData.objects_for_a_month(month, year, self).map{|e| e.amount.to_i}.sum
    erp_marketing_fixed_expenses = MarketingFixedExpense.expenses_for_month(month, year, self)
    erp_employee_payroll_expenses = erp_employee_payroll_expenses_for_month(month, year)
    miscellaneous_expenses = MiscellaneousExpense.expenses_for_month(month, year, self)

    digital_marketing_expenses + erp_marketing_fixed_expenses + (erp_employee_payroll_expenses * 0.075) + (erp_employee_payroll_expenses * 0.1) + miscellaneous_expenses + erp_employee_payroll_expenses + (((OwnerSalaryComponent.owner_salary_for_month(month, year, self) * 26 ) / 12 + OwnerSalaryComponent.owner_commission_for_month(month, year, self) ) * 2) + (((OwnerSalaryComponent.spouse_salary_for_month(month, year, self) * 26 ) / 12 + OwnerSalaryComponent.spouse_commission_for_month(month, year, self) ) * 2)
  end

  def revenue_for_month(year, month)
    if self.name == 'Elite Rehab Placement'
      self.erp_revenue_for_month(month, year)
    else
      Revenue.revenue_for_a_month(self, month, year) 
    end
  end

  def expenses_for_month(month, year)
    if self.name == 'Elite Rehab Placement'
      self.erp_expenses_for_month(month, year)
    else
      self.non_erp_expenses_for_month(month, year)
    end
  end

  def payroll_expenses_for_month(month, year)
    if self.name == 'Elite Rehab Placement'
      self.erp_employee_payroll_expenses_for_month(month, year)
    else
      self.non_erp_payroll_expenses_for_month(month, year)
    end
  end

  def owner_salary_total(month, year)
    OwnerSalaryComponent.owner_salary_for_month(month, year, self) + OwnerSalaryComponent.owner_commission_for_month(month, year, self)
  end

  def erp_fixed_total(month, year)
    erp_operating_expenses = ErpOperatingExpense.expenses_for_month(month, year, self)
    erp_employee_payroll_expenses = erp_employee_payroll_expenses_for_month(month, year)
    erp_operating_expenses + (erp_employee_payroll_expenses * 0.075) + (erp_employee_payroll_expenses * 0.1) + MiscellaneousExpense.expenses_for_month(month, year, self)
  end

  def non_erp_fixed_total(month, year)
    lease_amount = CompanyLeaseInformation.objects_for_a_month(month, year, self).map{|l| l.total_lease_amount.to_i}.sum
    sc_other_expenses = SunshineCenterOtherExpense.expenses_for_month(month, year, self)
    sc_utility_expenses = UtilityExpense.expenses_for_month(month, year, self)

    lease_amount + (sc_utility_expenses * self.houses.count) + sc_other_expenses
  end

  def fixed_total(month, year)
    if self.name == 'Elite Rehab Placement'
      self.erp_fixed_total(month, year)
    else
      self.non_erp_fixed_total(month, year)
    end
  end
end