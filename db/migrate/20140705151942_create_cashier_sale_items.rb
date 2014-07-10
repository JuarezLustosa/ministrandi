class CreateCashierSaleItems < ActiveRecord::Migration
  def change
    create_table :cashier_sale_items do |t|
      t.references :sale, index: true
      t.references :product, index: true
      t.decimal :unit_price
      t.decimal :descount
      t.boolean :state
      t.integer :canceled_reason

      t.timestamps
    end
  end
end
