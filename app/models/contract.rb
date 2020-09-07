class Contract < ApplicationRecord
  belongs_to :currency
  belongs_to :type_of_exchange
  belongs_to :type_of_payment
  belongs_to :type_of_contract
  has_and_belongs_to_many :products
  belongs_to :provider, class_name: 'Organization'
  belongs_to :customer, class_name: 'Organization'
end