class CreateInvoiceProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_products do |t|
      t.string :full_name
      t.string :short_name
      t.string :code
      t.integer :count, default: 0
      t.float :price
      t.references :rate_vat, null: false, foreign_key: true
      t.float :summa_nds
      t.float :cost
      t.float :cost_with_nds
      t.references :unit, null: false, foreign_key: true
      t.references :p_subgroup, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
