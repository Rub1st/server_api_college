class AddIndexToPGroup < ActiveRecord::Migration[6.0]
  def change
    add_index :p_groups, :name, unique: true
  end
end
