class AddColumnNfKeyAccessToFeedstockEntrances < ActiveRecord::Migration
  def change
    add_column :feedstock_entrances, :nf_key_access, :string
  end
end
