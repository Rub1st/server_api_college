class Warehouse < ApplicationRecord
  belongs_to :organization
  validates :address, :organization, presence: true
end
