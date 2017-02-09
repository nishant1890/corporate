class MiscellaneousExpense < Expense
  validates_presence_of :miscellaneous_expense_type, :month, :year, :company_id
  validates :miscellaneous_expense_type, inclusion: {in: ['Travel', 'Gift Card', 'Miscellaneous']}
  belongs_to :company
end