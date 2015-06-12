class AddColumnVendorIdToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :user_id, :integer, index: true, foreign_key: true 
  end
end