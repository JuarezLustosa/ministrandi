class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.integer :quantity
      t.boolean :state
      t.integer :canceled_reason
      t.float :unit_price
      t.float :total_price
      t.float :descount, default: 0.0

      t.timestamps
    end
  end
end
