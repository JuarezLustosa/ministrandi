class AddStatusCostPriceToProducts < ActiveRecord::Migration
  def up
    add_column :products, :cost_price, :decimal
    add_column :products, :inactive, :boolean, :default => false
  end
  
  def down
    remove_column :products, :cost_price
    remove_column :products, :inactive
  end
end