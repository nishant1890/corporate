class CompanyLeaseInformation < ApplicationRecord
  belongs_to :company
  belongs_to :house
  validates_presence_of :start_date, :end_date
end
