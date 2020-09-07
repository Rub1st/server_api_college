class CreateJoinTableContractProduct < ActiveRecord::Migration[6.0]
  def change
    create_join_table :contracts, :products do |t|
      t.index [:contract_id, :product_id]
    end
  end
end
