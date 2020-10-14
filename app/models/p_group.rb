class PGroup < ApplicationRecord
    has_many :p_subgroups, dependent: :destroy
    validates_uniqueness_of :name
    validates :name, presence: { message: "Поле не может быть пустым" }
end
