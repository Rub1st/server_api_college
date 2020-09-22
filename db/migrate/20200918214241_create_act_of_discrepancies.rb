class CreateActOfDiscrepancies < ActiveRecord::Migration[6.0]
  def change
    create_table :act_of_discrepancies do |t|
      t.boolean :is_closed
      t.boolean :is_conducted
      t.string :series_and_number
      t.datetime :date_and_time
      t.integer :strings_count
      t.integer :total_count
      t.float :summa_nds
      t.float :summa_with_nds
      t.string :note
      t.references :invoice_type, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.references :provider_warehouse, foreign_key: {to_table: 'warehouses'}
      t.references :customer_warehouse, foreign_key: {to_table: 'warehouses'}
      

      t.timestamps
    end
  end
end
