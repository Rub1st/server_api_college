class CreateJoinTableProductsPSubgroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :p_subgroups, :products do |t|
      t.index [:p_subgroup_id, :product_id]
    end
  end
end
