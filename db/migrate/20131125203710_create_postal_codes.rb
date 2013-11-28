class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|
      t.string :city
      t.string :neighborhood
      t.integer :street_type
      t.string :street
      t.string :cep
      t.integer :state

      t.timestamps
    end
  end
end
