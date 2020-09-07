class AddIndexToPSubgroup < ActiveRecord::Migration[6.0]
  def change
    add_index :p_subgroups, :name, unique: true
  end
end
