class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.string :barcode
      t.integer :valid_date
      t.decimal :retail_price, :precision => 8, :scale => 2
      t.decimal :wholesale, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
