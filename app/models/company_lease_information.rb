class CompanyLeaseInformation < ApplicationRecord
  belongs_to :company
  belongs_to :house
  validates_presence_of :start_date, :end_date

  def self.expense_object_for_a_month(month, year, company)
    Expense.where(date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a)
  end

  def self.expenses_for_a_month(month, year)
    expense_objects = expense_object_for_a_month(month, year)
    # expense_objects.select{||}
  end
end
