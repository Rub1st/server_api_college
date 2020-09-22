class PSubgroup < ApplicationRecord
  belongs_to :p_group
  has_and_belongs_to_many :act_of_discrepancies_products
  has_and_belongs_to_many :invoice_products
  validates_uniqueness_of :name
  validates :name, :p_group, presence: true
end
