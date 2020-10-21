class Invoice < ApplicationRecord
  belongs_to :invoice_type
  belongs_to :operation
  belongs_to :currency
  belongs_to :contract
  belongs_to :agreement
  belongs_to :status_of_price_tag_printing
  belongs_to :status_of_acceptance
  belongs_to :status_of_booting_in_equipment
  has_many :invoice_products, dependent: :destroy
  has_many :act_of_discrepancies, dependent: :destroy
  validates :series_and_number,
            :summa,
            :summa_nds,
            :summa_with_nds,
            :record_summa,
            :retail_summa,
            :pre_assessment_summa,
            :write_down_summa,
            :strings_count,
            :total_count,
            presence: { message: 'Поля: серия/номер, сумма, сумма НДС, сумма с НДС, сумма (учетная), сумма розничная, сумма дооценки, сумма списания, кол-во строк и кол-во всего являются обязательными к заполнению.' }
end
