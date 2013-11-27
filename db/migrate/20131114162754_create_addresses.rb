class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :cep
      t.integer :street_type
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.integer :city
      t.integer :state
      t.references :client, index: true
      t.references :supplier, index: true
      
      t.timestamps
    end
  end
end
