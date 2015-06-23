class Cashier::Sale::Item < ActiveRecord::Base
  before_save :save_total_unit
  after_save :touch_sale
  after_destroy :touch_sale
  belongs_to :sale
  belongs_to :product
  
  attr_accessible :product_id, :sale_id, :unit_price, :quantity, :barcode, :product

  validates_uniqueness_of :product_id, :scope => :sale_id
  validates_presence_of :quantity, :product_id
  
  delegate  :name, :retail_price, :unit, :to => :product, allow_nil: true, prefix: true
  
  scope :sum_quantity_by_date_in_a_determinated_product, lambda { |month, year, product_id|
    joins(:sale).where("EXTRACT(MONTH FROM cashier_sales.created_at) = ? AND EXTRACT(YEAR FROM cashier_sales.created_at) = ?", month, year)
    .where(:product_id => product_id).sum(:quantity)
  }
  
  protected
  
  def touch_sale
    sale.save
  end
  
  def save_total_unit
    self.total_unit = unit_price * quantity
  end
end
