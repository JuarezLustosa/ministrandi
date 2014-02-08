class AddTypeToUser < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean
    add_column :users, :vendor, :boolean
    add_column :users, :percent, :integer
  end
  
  def down
    remove_column :users, :admin
    remove_column :users, :vendor 
    remove_column :users, :percent
  end
end