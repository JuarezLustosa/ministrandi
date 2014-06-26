class Client < ActiveRecord::Base
  attr_accessible :name, :cnpj, :cpf, 
                  :contact, :email, 
                  :phone1, :phone2, :fantasy_name, 
                  :city_inscription, :state_inscription, :person,
                  :address_attributes
                  
  has_one :address
  accepts_nested_attributes_for :address
  
  validates_presence_of :address, :name, :cnpj
  
  delegate :city_name, :to => :address, allow_nil: true

  scope :search_by_name, lambda { |term| order(:name).where('name ILIKE ? OR fantasy_name ILIKE ?', "#{term}%", "#{term}%") }
end
