class Client < ActiveRecord::Base
  attr_accessible :name, :cnpj, :cpf, 
                  :contact, :email, 
                  :phone1, :phone2, :fantasy_name, 
                  :city_inscription, :state_inscription, :person
                  
  has_one :address
  accepts_nested_attributes_for :address


  scope :search_by_name, lambda { |term| order(:name).where('name like ?', "#{term}%") } 
end
