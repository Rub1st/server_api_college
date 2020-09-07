class TypeOfPayment < ApplicationRecord
    has_many :contracts, :dependent => :delete_all
    validates :name, presence: true
end
