class AddColunmInactiveInClients < ActiveRecord::Migration
  def change
  	add_column :clients, :inactive, :boolean, :default => false
  	add_column :clients, :info, :text
  	
  end
end
