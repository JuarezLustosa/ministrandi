class CreateCashierSales < ActiveRecord::Migration
  def change
    create_table :cashier_sales do |t|
      t.references :cashier, index: true
      t.integer :payment, :null => false
      t.decimal :valor, :null => false
      t.decimal :descount
      t.decimal :change
      t.string  :state, :null => false

      t.timestamps
    end
  end
end
