class ChangeColumnTotalInOrder < ActiveRecord::Migration
  def change
    change_column :orders, :total, :float
  end
end