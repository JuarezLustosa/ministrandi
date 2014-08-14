class AddNotNullOnNatureInOrders < ActiveRecord::Migration
  def change
    Order.transaction do
      Order.all.each do |order|
        order.nature = 0
        order.save
      end
    end
    
    change_column :orders, :nature, :integer, :null => false
  end
end