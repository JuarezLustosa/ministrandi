class AddCollumnNfToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :nf, :boolean
  end
end