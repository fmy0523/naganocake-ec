class RemoveCreatedFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :created, :datetime
  end
end
