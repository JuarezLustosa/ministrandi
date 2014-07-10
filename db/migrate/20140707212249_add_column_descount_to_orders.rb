class AddColumnDescountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :descount, :float, :default => 0
  end
end