class Unit < ApplicationRecord
    has_many :invoice_products, :dependent => :delete_all
    validates :full_name, :short_name, :gramms, presence: true
end
