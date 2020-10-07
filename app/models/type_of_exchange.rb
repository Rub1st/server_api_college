class TypeOfExchange < ApplicationRecord
    has_many :contracts, dependent: :destroy
    validates :name, presence: true
end
