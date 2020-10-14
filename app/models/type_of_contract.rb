class TypeOfContract < ApplicationRecord
    has_many :contracts, dependent: :destroy
    validates :name, presence: { message: "Поле не может быть пустым" }
end
