class Currency < ApplicationRecord
    has_many :invoices, dependent: :destroy
    has_many :act_of_discrepancies, dependent: :destroy
    has_many :contracts, dependent: :destroy
    validates :short_name, :full_name,
    presence: { message: 'Поля: короткое наименование и полное наименование являются обязательными к заполнению.' }
end
