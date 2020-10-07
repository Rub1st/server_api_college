class Operation < ApplicationRecord
    has_many :invoices, dependent: :destroy
    has_many :act_of_discrepancies, dependent: :destroy
    validates :name, presence: true
end
