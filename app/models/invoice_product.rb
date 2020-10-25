class InvoiceProduct < ApplicationRecord
  belongs_to :rate_vat
  belongs_to :unit
  belongs_to :p_subgroup
  belongs_to :invoice
  has_many :act_of_discrepancies_products, dependent: :destroy
  has_many :costs, dependent: :destroy
  validates :full_name,
            :code,
            :count,
            :price,
            :summa_nds,
            presence: { message: 'Поля: полное имя, код, цена, сумма НДС и количество являются обязательными к заполнению.' }
end
