class CreateStatusOfAcceptances < ActiveRecord::Migration[6.0]
  def change
    create_table :status_of_acceptances do |t|
      t.string :name

      t.timestamps
    end
  end
end
