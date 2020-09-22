class CreateStatusOfBootingInEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :status_of_booting_in_equipments do |t|
      t.string :name

      t.timestamps
    end
  end
end
