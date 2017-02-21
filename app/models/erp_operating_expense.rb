class ErpOperatingExpense < ApplicationRecord
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    objects = ErpOperatingExpense.where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company)
    objects.each_with_object([]) do |e, a|
      a << e.paycheck.try(:to_i)
      a << e.insurance.try(:to_i)
      a << e.office.try(:to_i)
      a << e.utilities.try(:to_i)
      a << e.internet.try(:to_i)
      a << e.phone.try(:to_i)
      a << e.rt.try(:to_i)
      a << e.salesforce.try(:to_i)
      a << e.sf_admin.try(:to_i)
      a << e.sms_magic.try(:to_i)
      a << e.lindexed.try(:to_i)
    end.reject{|a| a.nil?}.sum
  end
end
