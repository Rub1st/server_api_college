class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :full_name
      t.string :short_name
      t.string :code
      t.float :price
      t.float :rate_nds
      t.float :summa_nds
      t.float :cost
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
