class CreateTypeOfContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :type_of_contracts do |t|
      t.string :name

      t.timestamps
    end
  end
end
