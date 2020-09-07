class Organization < ApplicationRecord
  belongs_to :ownership_form
  has_many :warehouses, :dependent => :delete_all
end
