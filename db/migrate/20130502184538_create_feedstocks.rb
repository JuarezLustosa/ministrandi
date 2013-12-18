class CreateFeedstocks < ActiveRecord::Migration
  def change
    create_table :feedstocks do |t|
      t.string :name, :null => false, :uniq => true
      t.text :description
      t.string :med
      t.decimal :weight
      t.integer :quantity, :default => 0
      t.integer :min_stock, :default => 0
      t.integer :critic_stock, :default => 0

      t.timestamps
    end
  end
end
