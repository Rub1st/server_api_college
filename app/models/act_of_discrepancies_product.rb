class ActOfDiscrepanciesProduct < ApplicationRecord
  belongs_to :invoice_product
  belongs_to :act_of_discrepancy
end
