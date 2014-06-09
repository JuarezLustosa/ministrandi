class AddMeasurementUnitToProducts < ActiveRecord::Migration
  def change
    add_column :products, :measurement_unit, :integer
  end
end
