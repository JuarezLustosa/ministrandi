class PostalCode < ActiveRecord::Base
  attr_accessible :city, :neighborhood, :street_type, :street, :cep
  
  scope :search_by_cep, lambda { |term| order(:cep).where("cep like ?", "#{term}%") }
end
