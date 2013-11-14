class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :product, index: true
      t.integer :quantity
      t.integer :local

      t.timestamps
    end
  end
end
