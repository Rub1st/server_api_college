class StatusOfPriceTagPrinting < ApplicationRecord
    has_many :invoices, dependent: :destroy
    validates :name, presence: { message: "Поле не может быть пустым" }
end
