class CreateContactInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state_prov_reg
      t.string :zip
      t.integer :phone
      t.text :special_instructions
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
