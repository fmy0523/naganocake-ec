class AddCreatedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :created, :timestamp
  end
end
