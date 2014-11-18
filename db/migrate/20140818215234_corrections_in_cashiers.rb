class CorrectionsInCashiers < ActiveRecord::Migration
  def change
    remove_column :cashier_sale_items, :state, :integer
    remove_column :cashier_sale_items, :canceled_reason, :integer
    remove_column :cashier_sales, :valor, :decimal
    change_column :cashier_sales, :descount, :decimal, :default => 0.0
    add_column :cashier_sales, :total, :decimal, :null => false
    add_column :cashier_sales, :money, :decimal
    add_column :cashier_sale_items, :quantity, :decimal, :null => false 
    add_column :cashier_sale_items, :barcode, :string
    add_column :cashier_sale_items, :total_unit, :decimal, :null => :false 
  end
end