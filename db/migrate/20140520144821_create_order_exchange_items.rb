class CreateOrderExchangeItems < ActiveRecord::Migration
  def change
    create_table :order_exchange_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity
      t.boolean :state
      t.integer :canceled_reason

      t.timestamps
    end
  end
end
