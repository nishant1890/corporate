module UsersHelper
  def permissions_select_options
    cruds = ['owner_salary_components', 'erp_operating_expenses', 'sunshine_center_other_expenses', 'utility_expenses', 'marketing_fixed_expenses', 'company_lease_informations', 'houses', 'revenues', 'payroll_datas', 'digital_marketing_datas', 'miscellaneous_expenses']
    cruds.each_with_object({}) {|c, h| h["Manage #{c.humanize}"] = "can_manage_#{c}" }
  end
end
