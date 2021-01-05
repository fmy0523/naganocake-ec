class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer :quantity
      t.bigint :item_id
      t.bigint :customer_id
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps
    end
    add_foreign_key :cart_items, :customers
    add_foreign_key :cart_items, :items
  end
end
