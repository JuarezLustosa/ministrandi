class AddColumnsExpireAtPaymentsDayToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :expired_at, :date
    add_column :orders, :payment_day, :integer
  end
end