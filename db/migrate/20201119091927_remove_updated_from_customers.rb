class RemoveUpdatedFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :updated, :datetime
  end
end
