class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.string :address
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
