class ActOfDiscrepanciesProduct < ApplicationRecord
  belongs_to :invoice_product
  belongs_to :act_of_discrepancy
  validates :code,
            :invoice_product,
            :count,
            :act_of_discrepancy,
            presence: { message: 'Поля: код, продукт, количество и акт расхождения являются обязательными к заполнению.' }
end
