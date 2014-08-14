class AddNatureColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :nature, :integer
  end
end