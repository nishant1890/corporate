class Company < ApplicationRecord
  validates_presence_of :name
    
  validates :contact, length: {minimum: 9, maximum: 9}

  has_many :revenues
  
  def calculate_month_expenses(month, year)
    
  end
end
