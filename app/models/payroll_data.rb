class PayrollData < Expense
  validates_presence_of :company_id, :date, :amount, :payroll_type
  validates :payroll_type, inclusion: {in: ['Employee Payroll', 'Commission', 'External Writers']}
  belongs_to :company
end