class CreateCenterCosts < ActiveRecord::Migration
  def change
    create_table :center_costs do |t|
      t.string :name
      t.string :ancestry

      t.timestamps
    end
  end
end
