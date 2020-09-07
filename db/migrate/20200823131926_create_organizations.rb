class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :short_name
      t.string :full_name
      t.string :unp
      t.string :legal_address
      t.string :phone_or_fax
      t.string :email
      t.boolean :is_provider
      t.boolean :is_buyer
      t.boolean :is_company
      t.references :ownership_form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
