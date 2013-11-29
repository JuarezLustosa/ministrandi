class Address < ActiveRecord::Base
  attr_accessible :id, :name, 
                  :cep, :street_type, :street, 
                  :number, :complement, :neighborhood, :city, :city_id,
                  :state
  belongs_to :client, :class_name => "Client", :foreign_key => "client_id"
  belongs_to :supplier, :class_name => "Supplier", :foreign_key => "supplier_id"
  belongs_to :city, :class_name => "City", :foreign_key => "city_id"
  
  validates_presence_of :street, :number, :neighborhood, :city, :state, :cep
end
