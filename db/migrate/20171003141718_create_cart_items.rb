class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :badge, foreign_key: true
      t.references :order, foreign_key: true
      t.decimal :unit_price, precision: 10, scale: 4
      t.integer :quantity
      t.decimal :total_price, precision: 10, scale: 4

      t.timestamps
    end
  end
end
