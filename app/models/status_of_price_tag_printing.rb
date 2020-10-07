class StatusOfPriceTagPrinting < ApplicationRecord
    has_many :invoices, dependent: :destroy
    validates :name, presence: true
end
