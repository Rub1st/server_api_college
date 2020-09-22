class InvoiceProduct < ApplicationRecord
  belongs_to :rate_nds
  belongs_to :unit
  belongs_to :p_subgroup
  belongs_to :invoice
end
