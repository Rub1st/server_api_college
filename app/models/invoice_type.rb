class InvoiceType < ApplicationRecord
    has_many :invoices, :dependent => :delete_all
    has_many :act_of_discrepancies, :dependent => :delete_all
    validates :name, presence: true
end
