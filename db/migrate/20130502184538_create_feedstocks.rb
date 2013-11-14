class CreateFeedstocks < ActiveRecord::Migration
  def change
    create_table :feedstocks do |t|
      t.string :name, :null => false, :uniq => true
      t.text :description
      t.string :med
      t.integer :quantity
      t.integer :min_stock
      t.integer :critic_stock

      t.timestamps
    end
  end
end
