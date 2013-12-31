class ChangeCollumnCepInAddresses < ActiveRecord::Migration
  def up
    change_table :addresses do |t|
      t.change :cep, :string
    end
  end
  
  def down
    change_table :addresses do |t|
      t.change :cep, :integer
    end
  end
end
