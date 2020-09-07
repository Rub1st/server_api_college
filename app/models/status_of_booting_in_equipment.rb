class StatusOfBootingInEquipment < ApplicationRecord
    has_many :invoices, :dependent => :delete_all
    validates :name, presence: true
end
