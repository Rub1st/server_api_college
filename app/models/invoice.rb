class Invoice < ApplicationRecord
  belongs_to :invoice_type
  belongs_to :operation
  belongs_to :currency
  belongs_to :contract
  belongs_to :agreement
  belongs_to :status_of_price_tag_printing
  belongs_to :status_of_acceptance
  belongs_to :status_of_booting_in_equipment
end
