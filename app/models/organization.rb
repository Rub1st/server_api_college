class Organization < ApplicationRecord
  belongs_to :ownership_form
  has_many :warehouses, dependent: :destroy
  has_many :provider_contracts, class_name: 'Contract', foreign_key: :provider_id, dependent: :destroy
  has_many :customer_contracts, class_name: 'Contract', foreign_key: :customer_id, dependent: :destroy
end
