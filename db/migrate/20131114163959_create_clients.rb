class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :person
      t.string :cnpj
      t.string :cpf
      t.string :fantasy_name
      t.string :state_inscription
      t.string :city_inscription
      t.string :contact
      t.string :email
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end
end
