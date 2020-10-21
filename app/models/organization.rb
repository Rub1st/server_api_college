class Organization < ApplicationRecord
  belongs_to :ownership_form
  has_many :warehouses, dependent: :destroy
  has_many :provider_contracts, class_name: 'Contract', foreign_key: :provider_id, dependent: :destroy
  has_many :customer_contracts, class_name: 'Contract', foreign_key: :customer_id, dependent: :destroy
  validates :full_name,
            :unp,
            :legal_address,
            presence: { message: 'Поля: наименование, УНП и адрес являются обязательными к заполнению.' }

  validates :phone_or_fax, format: { with: /(\+375|80)\s?(44|25|33|17|29)\s?\d{3}-?\s?\d{2}-?\s?\d{2}/,
    allow_blank: true,
    message: "Телефон должен быть записан в формате '[код оператора] [2 цифры индентификатора] XXX-XX-XX'"}
  validates :email, format: { with: /@/,
  allow_blank: true,
  message: "Email должен быть записан в формате 'xxxx...xxx@xxxx.xxx"}
end
