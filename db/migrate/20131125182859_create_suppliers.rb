class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :cnpj
      t.string :fantasy
      t.string :contact
      t.string :email
      t.integer :phone1
      t.integer :phone2
      t.string :state_scription

      t.timestamps
    end
  end
end
