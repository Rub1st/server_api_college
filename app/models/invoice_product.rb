class InvoiceProduct < ApplicationRecord
  belongs_to :rate_vat
  belongs_to :unit
  belongs_to :p_subgroup
  belongs_to :invoice
  has_many :act_of_discrepancies_products, dependent: :destroy
end
