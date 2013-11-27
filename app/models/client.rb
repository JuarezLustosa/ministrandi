class Client < ActiveRecord::Base
  attr_accessible :name, :cnpj, :cpf, :social_reason, :contact, :email, :phone1, :phone2
  has_one :address
  
  accepts_nested_attributes_for :address
end
