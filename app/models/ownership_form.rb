class OwnershipForm < ApplicationRecord
    has_many :organizations, dependent: :destroy
    validates :name, presence: { message: "Поле не может быть пустым" }
end
