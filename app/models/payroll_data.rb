class PayrollData < Expense
  validates_presence_of :company_id, :date, :amount, :payroll_type
  validates :payroll_type, inclusion: {in: ['Employee Payroll', 'Commission', 'External Writers']}
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    objects = PayrollData.where({date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company).map{|e| e.amount.to_i}.sum
  end


end