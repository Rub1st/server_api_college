class CreateStatusOfPriceTagPrintings < ActiveRecord::Migration[6.0]
  def change
    create_table :status_of_price_tag_printings do |t|
      t.string :name

      t.timestamps
    end
  end
end
