class Revenue < ApplicationRecord
  belongs_to :company
  validates :type_of_revenue, inclusion: {in: ['Cash', 'Insurance Payout', 'Refund', 'ERP', 'Early Checkout']}
end
