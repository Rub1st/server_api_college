class CreateCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :costs do |t|
      t.references :invoice_product, null: false, foreign_key: true
      t.float :wholesale_percent
      t.float :wholesale_value
      t.float :commercial_percent
      t.float :commercial_value
      t.float :nds_percent
      t.float :nds_value
      t.float :retail_price
      t.float :cost

      t.timestamps
    end
  end
end
