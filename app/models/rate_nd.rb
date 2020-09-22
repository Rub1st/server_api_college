class RateNd < ApplicationRecord
    has_many :act_of_discrepancies_products, :dependent => :delete_all
    has_many :invoice_products, :dependent => :delete_all
    validates :name, presence: true
end
