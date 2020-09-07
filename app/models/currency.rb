class Currency < ApplicationRecord
    has_many :invoices, :dependent => :delete_all
    has_many :act_of_discrepancies, :dependent => :delete_all
    has_many :contracts, :dependent => :delete_all
    validates :short_name, :full_name, presence: true
end
