class SunshineCenterOtherExpense < ApplicationRecord

  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    objects = SunshineCenterOtherExpense.where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company)
    objects.each_with_object([]) do |e, a|
      a << e.hosting.try(:to_i)
      a << blogging.try(:to_i)
      a << e.facebook.try(:to_i)
      a << e.liability_insurance.try(:to_i)
      a << e.heath_insurance.try(:to_i)
      a << e.detox.try(:to_i)
      a << e.workers_compensation.try(:to_i)
      a << e.fica.try(:to_i)
      a << e.office_supplies.try(:to_i)
      a << e.cort.try(:to_i)
      a << e.kipu.try(:to_i)
      a << e.miscellaneous.try(:to_i)
    end.reject{|a| a.nil?}.sum
  end
end
