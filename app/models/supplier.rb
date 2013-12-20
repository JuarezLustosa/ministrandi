class Supplier < ActiveRecord::Base
  attr_accessible :name, :cnpj, :fantasy, 
                  :contact, :email, :phone1, 
                  :phone2, :state_scription, :address_attributes
                  
  has_one :address
  
  delegate :city_name, to: :address, prefix: true, allow_nil: true 
  
  accepts_nested_attributes_for :address
  
  scope :search_by_name, lambda { |term| order(:name).where("name like ?", "#{term}%") }
end
