class PGroup < ApplicationRecord
    has_many :p_subgroups, :dependent => :delete_all
    validates_uniqueness_of :name
    validates :name, presence: true
end
