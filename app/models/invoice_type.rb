class InvoiceType < ApplicationRecord
    has_many :invoices, dependent: :destroy
    has_many :act_of_discrepancies, dependent: :destroy
    validates :name, presence: { message: "Поле не может быть пустым" }
end
