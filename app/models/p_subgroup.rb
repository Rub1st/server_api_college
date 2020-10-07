class PSubgroup < ApplicationRecord
  belongs_to :p_group
  has_many :invoice_products,  dependent: :destroy
  validates_uniqueness_of :name
  validates :name, :p_group, presence: true
end
