class Cost < ApplicationRecord
  belongs_to :invoice_product
  validates :wholesale_percent,
            :commercial_percent,
            :nds_percent,
            presence: { message: 'Поля: оптовая надбавка, торговая надбавка, процент НДС и товар прихода являются обязательными к заполнению.' }
end