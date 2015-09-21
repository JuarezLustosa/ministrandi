class AddCollumnMinStockToStocks < ActiveRecord::Migration
  def change
  	add_column :stocks, :min_stock, :integer, :default => 0
  end
end
