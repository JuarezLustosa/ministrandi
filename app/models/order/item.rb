class Order::Item < ActiveRecord::Base
  before_save :sun_tatal_item
  belongs_to :product
  belongs_to :order, :class_name => "Order", :foreign_key => "order_id"
  
  attr_accessible :order_id, :product, :product_id, :quantity, :unit_price, :total_price, :descount
  
  delegate :name, to: :product, allow_nil: true, prefix: true
  delegate :stock, :cod, to: :product, allow_nil: true, prefix: true
  
  validates_presence_of :product, :product_id, :unit_price, :quantity
  validates_uniqueness_of :product, :scope =>  :order_id
  
  def calculate_percent_of(number) # refatorar
    percent = number / 100
    total_price - (total_price * percent)
  end
  
  protected
  def sun_tatal_item #refatora isso
    self.total_price = quantity * unit_price
    self.total_price =  calculate_percent_of(descount) if descount
  end
end