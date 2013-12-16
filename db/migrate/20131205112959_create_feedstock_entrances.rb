class CreateFeedstockEntrances < ActiveRecord::Migration
  def change
    create_table :feedstock_entrances do |t|
      t.references :supplier, index: true
      t.decimal :freight_price
      t.datetime :date
      t.integer :nf_number
      t.string :status, :default => "OPEN"

      t.timestamps
    end
  end
end
