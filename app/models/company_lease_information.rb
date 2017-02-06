class CompanyLeaseInformation < ApplicationRecord
  belongs_to :company
  validates_presence_of :start_date, :end_date
end
