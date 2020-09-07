class OwnershipForm < ApplicationRecord
    has_many :organizations, :dependent => :delete_all
    validates :name, presence: true
end
