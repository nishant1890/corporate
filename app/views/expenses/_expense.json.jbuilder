json.extract! expense, :id, :company_name, :date, :amount, :payroll_type, :search_engine, :month, :year, :miscellaneous_expense_type, :company_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)