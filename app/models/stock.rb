class Stock < ActiveRecord::Base
  has_enumeration_for :local, :with => StockLocations
  attr_accessible :product_id, :product, :quantity, :local, :cost_price, :status
  belongs_to :product
  validates_presence_of :product
  delegate  :name, :to => :product, :allow_blank => true, :prefix => true
  
  validates_presence_of :product, :quantity, :local
  validates_uniqueness_of :product, scope: :local
  
  scope :ordered_by_product_name, -> { order("products.name ASC").joins(:product) }
end
