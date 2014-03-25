class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, :null => false
      t.references :client, index: true, :null => false
      t.string :state
      t.integer :total, :null => false, :default => "0"
      t.integer :payment
      t.date :date
      t.integer :priority

      t.timestamps
    end
  end
end
