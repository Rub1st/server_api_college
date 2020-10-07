class ActOfDiscrepancy < ApplicationRecord
  belongs_to :invoice_type
  belongs_to :operation
  belongs_to :currency
  belongs_to :invoice
  belongs_to :provider_warehouse, class_name: 'Warehouse'
  belongs_to :customer_warehouse, class_name: 'Warehouse'
  has_many :act_of_discrepancies_products, dependent: :destroy
end
