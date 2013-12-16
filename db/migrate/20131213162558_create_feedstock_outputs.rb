class CreateFeedstockOutputs < ActiveRecord::Migration
  def change
    create_table :feedstock_outputs do |t|
      t.string :status
      t.datetime :date
      t.string :employee

      t.timestamps
    end
  end
end
