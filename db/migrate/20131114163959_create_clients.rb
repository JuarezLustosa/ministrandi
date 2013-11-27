class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :cnpj
      t.integer :cpf
      t.string :social_reason
      t.string :contact
      t.string :email
      t.integer :phone1
      t.integer :phone2

      t.timestamps
    end
  end
end
