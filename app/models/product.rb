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
  scope :search_by_name_or_cod, lambda { |term| where("name ILIKE ? OR cod ILIKE ?", "#{term}%", "#{term}")}
  scope :search_by_name_or_cod_in_stock, lambda { |term| joins(:stock).where("name ILIKE ? OR cod ILIKE ?", "#{term}%", "#{term}") }
  
  scope :search_by_name_in_industry, lambda { |term| 
    query = search_by_name_or_cod_in_stock(term)
    query = query.where(:stocks => {:local => StockLocations::MANUFACTURE}) 
  }
  
  scope :search_by_name_in_store, lambda { |term| 
    query = search_by_name_or_cod_in_stock(term)
    query = query.where(:stocks => {:local => StockLocations::STORE}) 
  }
  
  delegate :name, :path, :to => :group, prefix: true, allow_nil: true
  
  def price criteria
    criteria === "ATACADO" ? wholesale : retail_price
  end
end
