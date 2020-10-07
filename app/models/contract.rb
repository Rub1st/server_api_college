class Contract < ApplicationRecord
  belongs_to :currency
  belongs_to :type_of_exchange
  belongs_to :type_of_payment
  belongs_to :type_of_contract
  belongs_to :provider, class_name: 'Organization'
  belongs_to :customer, class_name: 'Organization'
  has_many :invoices, dependent: :destroy
end
