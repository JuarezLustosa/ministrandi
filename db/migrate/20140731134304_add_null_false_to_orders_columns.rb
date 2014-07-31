class AddNullFalseToOrdersColumns < ActiveRecord::Migration
  def change
    add_money_to_all_payments
    change_column_null :orders, :payment, false
    change_column_null :orders, :client_id, false
    change_column_null :orders, :date, false
  end
  
  def add_money_to_all_payments
    Order.all.each do |order|
      order.payment = Orders::Payments::MONEY
      order.save!
    end
  end
end