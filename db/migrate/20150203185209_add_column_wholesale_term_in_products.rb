class AddColumnWholesaleTermInProducts < ActiveRecord::Migration
  def change
    add_column :products, :wholesale_term, :decimal
  end
end