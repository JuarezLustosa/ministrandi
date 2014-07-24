class Product < ActiveRecord::Base  
  has_enumeration_for :measurement_unit, :with => Products::MeasurementUnits
  has_one :stock, :class_name => "Stock"
  belongs_to :group, :class_name => "Product::Group", :foreign_key => "group_id"
  
  attr_accessible :id, :name, 
                  :unit, :barcode, :valid_date, 
                  :retail_price, :wholesale,
                  :cod, :measurement_unit, :group_id
                  
  validates_presence_of :name, :retail_price, :wholesale, :group_id
  validates_uniqueness_of :barcode
  
  scope :ordered, -> { order(:name) }
  scope :search_by_name, lambda { |term| query = where("name like ?", "#{term}%")}
  
  scope :search_by_name_in_industry, lambda { |term| 
    query = joins(:stock).where("name like ?", "#{term}%")
    query = query.where(:stocks => {:local => StockLocations::MANUFACTURE}) 
  }
  
  scope :search_by_name_in_store, lambda { |term| 
    query = joins(:stock).where("name like ?", "#{term}%")
    query = query.where(:stocks => {:local => StockLocations::STORE}) 
  }
  
  delegate :name, :path, :to => :group, prefix: true, allow_nil: true
  
  def price criteria
    criteria === "ATACADO" ? wholesale : retail_price
  end
end
