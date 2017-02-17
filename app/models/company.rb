class Company < ApplicationRecord
  validates_presence_of :name
    
  validates :contact, length: {minimum: 9, maximum: 9}

  has_many :revenues
  
  # def monthly_marketing_expenses(month, year)
  #   DigitalMarketingExpense.where()
end
