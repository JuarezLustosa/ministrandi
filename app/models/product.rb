class Product < ActiveRecord::Base  
  
  attr_accessible :id, :name, 
                  :unit, :barcode, :valid_date, 
                  :retail_price, :wholesale,
                  :cod
                  
  validates_presence_of :name, :retail_price, :wholesale
  validates_uniqueness_of :barcode
  
  has_one :stock, :class_name => "Stock"
  
  scope :search_by_name, lambda { |term| 
    query = where("name like ?", "#{term}%")}
  
  scope :search_by_name_in_industry, lambda { |term| 
    query = joins(:stock).where("name like ?", "#{term}%")
    query = query.where(:stocks => {:local => StockLocations::MANUFACTURE}) 
  }
  
  scope :search_by_name_in_store, lambda { |term| 
    query = joins(:stock).where("name like ?", "#{term}%")
    query = query.where(:stocks => {:local => StockLocations::STORE}) 
  } 
end
