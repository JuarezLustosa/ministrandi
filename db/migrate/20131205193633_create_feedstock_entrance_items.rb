class CreateFeedstockEntranceItems < ActiveRecord::Migration
  def change
    create_table :feedstock_entrance_items do |t|
      t.references :feedstock, index: true
      t.integer :entrance_id, index: true
      t.integer :quantity
      t.decimal :price_unit

      t.timestamps
    end
  end
end
