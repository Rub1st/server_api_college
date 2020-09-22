class CreateRateNds < ActiveRecord::Migration[6.0]
  def change
    create_table :rate_nds do |t|
      t.integer :rate

      t.timestamps
    end
  end
end
