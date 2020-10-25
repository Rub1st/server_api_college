class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.boolean :is_closed
      t.boolean :is_conducted
      t.string :series_and_number
      t.date :date_and_time
      t.boolean :selling_on_commission
      t.integer :strings_count
      t.integer :total_count
      t.float :summa
      t.float :summa_nds
      t.float :summa_with_nds
      t.float :record_summa
      t.float :retail_summa
      t.float :pre_assessment_summa
      t.float :write_down_summa
      t.string :note
      t.references :invoice_type, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.references :contract, null: false, foreign_key: true
      t.references :agreement, null: false, foreign_key: true
      t.references :status_of_price_tag_printing, null: false, foreign_key: true
      t.references :status_of_acceptance, null: false, foreign_key: true
      t.references :status_of_booting_in_equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
