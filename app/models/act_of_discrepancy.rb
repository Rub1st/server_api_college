class ActOfDiscrepancy < ApplicationRecord
  belongs_to :invoice_type
  belongs_to :operation
  belongs_to :currency
  belongs_to :invoice
  belongs_to :provider_warehouse, class_name: 'Warehouse'
  belongs_to :customer_warehouse, class_name: 'Warehouse'
  has_many :act_of_discrepancies_products, dependent: :destroy
  validates :series_and_number,
            :summa_nds,
            :summa_with_nds,
            :strings_count,
            :total_count,
            :operation,
            :currency,
            :provider_warehouse,
            :customer_warehouse,
            presence: { message: 'Поля: серия/номер, сумма НДС, сумма с НДС, кол-во строк, кол-во всего, ТТН, операция, склад поставщика и склад покупателя являются обязательными к заполнению.' }
end
