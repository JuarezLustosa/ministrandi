class ChangeCollunsMoneyChangeToDefault0 < ActiveRecord::Migration
  def change
  	change_column :cashier_sales, :money, :decimal, default: 0.0
  	change_column :cashier_sales, :change, :decimal, default: 0.0
  end
end
