class RateVat < ApplicationRecord
    has_many :invoice_products, dependent: :destroy
    validates :rate, presence: true
end
