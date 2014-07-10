class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.integer :location
      t.string :state

      t.timestamps
    end
  end
end
