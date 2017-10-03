class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :items_count
      t.decimal :subtotal, precision: 10, scale: 4
      t.decimal :shipping_handling, precision: 10, scale: 4
      t.decimal :tax, precision: 10, scale: 4
      t.decimal :total, precision: 10, scale: 4
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
