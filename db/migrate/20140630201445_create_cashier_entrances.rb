class CreateCashierEntrances < ActiveRecord::Migration
  def change
    create_table :cashier_entrances do |t|
      t.decimal :money
      t.references :user, index: true, :null => false
      t.references :cashier, index: true, :null => false

      t.timestamps
    end
  end
end
