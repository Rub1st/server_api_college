class Unit < ApplicationRecord
    has_many :products, :dependent => :delete_all
    validates :full_name, :short_name, presence: true
end
