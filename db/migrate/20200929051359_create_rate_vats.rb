class CreateRateVats < ActiveRecord::Migration[6.0]
  def change
    create_table :rate_vats do |t|
      t.integer :rate

      t.timestamps
    end
  end
end
