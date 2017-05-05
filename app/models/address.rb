class Address < ActiveRecord::Base
  has_enumeration_for :street_type, 
    :with => StreetType, :create_helpers => true, :create_scopes => true
  attr_accessible :id, :name, 
                  :cep, :street_type, :street, 
                  :number, :complement, :neighborhood, :city, :city_id,
                  :state
  belongs_to :client, :class_name => "Client", :foreign_key => "client_id"
  belongs_to :supplier, :class_name => "Supplier", :foreign_key => "supplier_id"
  belongs_to :city, :class_name => "City", :foreign_key => "city_id"
  
  delegate :name, :to => :city, allow_blanck: true, prefix: true
  
  validates_presence_of :street, :number, :neighborhood, :city, :state, :cep
  
  scope :search_by_street, lambda { |term| order(:street).where("street like ?", "#{term}%") }
  
  def complete
    "#{street_type_humanize}: #{street} #{number} - #{neighborhood}"
  end
end
