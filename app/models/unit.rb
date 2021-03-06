class Unit < ApplicationRecord
    has_many :invoice_products, dependent: :destroy
    validates :full_name,
              :short_name,
              :gramms,
              presence: { message: 'Поля: полное наименование, короткое наименование и граммы являются обязательными к заполнению.' }
end
