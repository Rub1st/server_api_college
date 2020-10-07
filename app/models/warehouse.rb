class Warehouse < ApplicationRecord
  belongs_to :organization
  validates :address, :organization, presence: true
  has_many :act_of_discrepancies, foreign_key: :provider_warehouse_id, dependent: :destroy
  # has_many :act_of_discrepancies, foreign_key: :customer_warehouse_id, dependent: :destroy
end
