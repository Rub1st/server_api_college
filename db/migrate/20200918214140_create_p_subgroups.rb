class CreatePSubgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :p_subgroups do |t|
      t.string :name
      t.references :p_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
