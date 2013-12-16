class CreateFeedstockOutputItems < ActiveRecord::Migration
  def change
    create_table :feedstock_output_items do |t|
      t.references :feedstock, index: true
      t.integer :output_id, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
