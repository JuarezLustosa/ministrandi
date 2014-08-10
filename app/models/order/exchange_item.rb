class Order::ExchangeItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  attr_accessible :order_id, :product, :product_id, :quantity
  validates_presence_of :product, :product_id, :quantity
  
  delegate :name, to: :product, allow_nil: true, prefix: true
  delegate :stock, to: :product, allow_nil: true, prefix: true
  validates_uniqueness_of :product, :scope =>  :order_id
  
  scope :sum_quantity_changed_by_date, lambda { |month, product_id|
    joins(:order).where("EXTRACT(MONTH FROM date) = ?", month).where(:product_id => product_id).sum(:quantity)
  }
end
