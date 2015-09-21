class Stock < ActiveRecord::Base
  has_enumeration_for :local, :with => StockLocations
  attr_accessible :product_id, :product, :quantity, :local, :cost_price, :status, :min_stock

  belongs_to :product

  delegate  :name, :to => :product, :allow_blank => true, :prefix => true
  
  validates_presence_of :product, :quantity, :local
  validates_uniqueness_of :product, scope: :local, :allow_blank => true
  validates_presence_of :product
  
  scope :store_location, -> { where(:local => StockLocations::STORE) }
  scope :manufactury_location, -> { where(:local => StockLocations::MANUFACTURE) }
  scope :ordered_by_product_name, -> { order("products.name ASC").joins(:product) }
  scope :critic_stock, -> { where(Stock.arel_table[:quantity].lteq(Stock.arel_table[:min_stock])) }
end
