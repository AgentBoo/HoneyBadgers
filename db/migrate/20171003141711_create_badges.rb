class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :product
      t.string :sku
      t.decimal :price, precision: 10, scale: 4
      t.string :size
      t.integer :quantity
      t.integer :year
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
