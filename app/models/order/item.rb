class Order::Item < ActiveRecord::Base
  before_save :sun_tatal_item
  after_save :touch_order #to update total order
  after_destroy :touch_order
  belongs_to :product
  belongs_to :order, :class_name => "Order", :foreign_key => "order_id"
  
  attr_accessible :order_id, :product, :product_id, :quantity, :unit_price, :total_price, :descount
  
  delegate :name, to: :product, allow_nil: true, prefix: true
  delegate :stock, :cod, to: :product, allow_nil: true, prefix: true
  
  validates_presence_of :product, :product_id, :unit_price, :quantity
  validates_uniqueness_of :product, :scope =>  :order_id, :message => "já adicionado"
  
  scope :sum_quantity_by_order_date_in_a_determinated_product, lambda { |month, year, product_id|
    joins(:order).where("EXTRACT(MONTH FROM date) = ? AND EXTRACT(YEAR FROM date) = ? ", month, year)
    .where(:product_id => product_id).sum(:quantity)
  }
  
  def calculate_percent_of(number) # refatorar
    percent = number / 100
    total_price - (total_price * percent)
  end
  
  protected
  def sun_tatal_item #refatora isso
    self.total_price = quantity * unit_price
    self.total_price = calculate_percent_of(descount) if descount
  end
  
  def touch_order
    order.save
  end
end