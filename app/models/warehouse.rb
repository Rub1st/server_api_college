class Warehouse < ApplicationRecord
  belongs_to :organization
  validates :address, presence: { message: "Поле не может быть пустым" }
  has_many :provider_act_of_discrepancies, class_name: 'ActOfDiscrepancy',
                                           foreign_key: :provider_warehouse_id,
                                           dependent: :destroy
  has_many :customer_act_of_discrepancies, class_name: 'ActOfDiscrepancy',
                                           foreign_key: :customer_warehouse_id,
                                           dependent: :destroy
end
