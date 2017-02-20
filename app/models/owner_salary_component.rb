class OwnerSalaryComponent < ApplicationRecord
  belongs_to :company

  def self.objects_for_a_month(month, year, company)
    where({start_date: (Date.new(year.to_i, month).beginning_of_month..Date.new(year.to_i, month).end_of_month).to_a, company_id: company.id})
  end

  def self.owner_salary_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company).map(&:owner_salary).sum
  end

  def self.owner_commission_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company).map(&:owner_commission).sum
  end

  def self.spouse_salary_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company).map(&:spouse_salary).sum
  end

  def self.spouse_commission_for_month(month, year, company)
    objects = objects_for_a_month(month, year, company).map(&:spouse_commission).sum
  end
    
end
