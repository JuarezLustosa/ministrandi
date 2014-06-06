class AddCodToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cod, :string
  end
end
