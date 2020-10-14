class RateVat < ApplicationRecord
    has_many :invoice_products, dependent: :destroy
    validates :rate, presence: { message: "Поле не может быть пустым" }
end
