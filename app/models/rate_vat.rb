class RateVat < ApplicationRecord
    has_many :invoice_products, :dependent => :delete_all
    validates :rate, presence: true
end
