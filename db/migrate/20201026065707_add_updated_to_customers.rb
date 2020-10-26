class AddUpdatedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :updated, :timestamp
  end
end
