class UtilityExpense < ApplicationRecord
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    objects = UtilityExpense.where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.expenses_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company)
    objects.each_with_object([]) do |e, a|
      a << e.gas.try(:to_i)
      a << e.electric.try(:to_i)
      a << e.water.try(:to_i)
      a << e.food.try(:to_i)
      a << e.yoga.try(:to_i)
      a << e.acupunture.try(:to_i)
      a << e.fuel.try(:to_i)
      a << e.auto.try(:to_i)
      a << e.landscaping.try(:to_i)
      a << e.cleaning.try(:to_i)
      a << e.total_per_house.try(:to_i)
    end.reject{|a| a.nil?}.sum
  end
end
