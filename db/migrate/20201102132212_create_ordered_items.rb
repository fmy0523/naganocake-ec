class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :tax_price
      t.integer :quantity
      t.timestamp :created_at
      t.timestamp :created_at
      t.timestamps
    end
    add_foreign_key :ordered_items, :orders
    add_foreign_key :ordered_items, :items
  end
end
