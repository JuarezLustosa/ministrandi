class Address < ActiveRecord::Base
  attr_accessible :id, :name, 
                  :cep, :street_type, :street, 
                  :number, :complement, :neighborhood, :city,
                  :state
  belongs_to :client, :class_name => "Client", :foreign_key => "client_id"
  belongs_to :supplier, :class_name => "Supplier", :foreign_key => "supplier_id"
  
  validates_presence_of :street, :number, :neighborhood, :city, :state, :cep
end
