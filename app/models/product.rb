class Product < ApplicationRecord
  belongs_to :unit
  has_and_belongs_to_many :contracts
  has_and_belongs_to_many :p_subgroups
end
