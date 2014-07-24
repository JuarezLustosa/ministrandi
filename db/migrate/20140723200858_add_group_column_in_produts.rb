class AddGroupColumnInProduts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.references :group, index: true
    end
  end
end