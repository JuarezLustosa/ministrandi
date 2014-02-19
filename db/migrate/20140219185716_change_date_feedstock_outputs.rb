class ChangeDateFeedstockOutputs < ActiveRecord::Migration
  def up
    change_table :feedstock_outputs do |t|
      t.change :date, :date
    end
  end

  def down
    change_table :feedstock_outputs do |t|
      t.change :date, :datetime
    end
  end
end
