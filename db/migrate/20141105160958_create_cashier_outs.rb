class CreateCashierOuts < ActiveRecord::Migration
  def change
    create_table :cashier_outs do |t|
      t.references :cashier, index: true
      t.decimal :money
      t.references :user, index: true

      t.timestamps
    end
  end
end
