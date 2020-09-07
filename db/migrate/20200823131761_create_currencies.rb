class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
