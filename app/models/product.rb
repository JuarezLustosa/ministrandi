class Product < ActiveRecord::Base  
  attr_accessible :id, :name, 
                  :unit, :barcode, :valid_date, 
                  :retail_price, :wholesale
                  
  validates_presence_of :name
  has_one :stock, :class_name => "Stock"
  
  scope :search_by_name, lambda { |term| order(:name).where("name like ?", "#{term}%") }
end
