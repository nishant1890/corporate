class MiscellaneousExpense < Expense
  validates_presence_of :miscellaneous_expense_type, :company_id
  validates :miscellaneous_expense_type, inclusion: {in: ['Travel', 'Gift Card', 'Miscellaneous']}
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    objects = PayrollData.where({date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company).map{|e| e.amount.to_i}.sum
  end
end