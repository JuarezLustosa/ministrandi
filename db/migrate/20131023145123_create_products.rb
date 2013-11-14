class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.integer :barcode
      t.integer :valid_date
      t.decimal :retail_price
      t.decimal :wholesale

      t.timestamps
    end
  end
end
