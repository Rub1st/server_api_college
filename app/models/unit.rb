class Unit < ApplicationRecord
    has_many :invoice_products, dependent: :destroy
    validates :full_name, :short_name, :gramms, presence: true
end
