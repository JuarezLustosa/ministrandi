class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :number
      t.string :description, :null => false
      t.string :barcode
      t.string :state
      t.date :release
      t.date :payment_day
      t.integer :category
      t.integer :bank
      t.decimal :valor, :default => 0.00
      t.decimal :valor_paid, :default => 0.00
      t.references :supplier, index: true
      t.references :feedstock_entrance, index: true
      t.references :center_cost, index: true
      t.timestamps
    end
  end
end
