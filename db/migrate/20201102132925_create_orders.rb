class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :freight
      t.integer :total
      t.integer :pay, null: :false, limit: 1
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps
    end
    add_foreign_key :orders, :customers
  end
end
