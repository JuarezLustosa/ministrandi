class Feedstock < ActiveRecord::Base
  attr_accessible :id, :name, :weight, :critic_stock, :description, :med, :min_stock, :quantity
  
  validates_presence_of :name, :med, :critic_stock, :min_stock, :quantity
  validates_uniqueness_of :name
  validates :quantity, numericality: { greater_than_or_equal_to: 0}

  scope :search_by_name, lambda { |term| order(:name).where("name like ?", "#{term}%") }
  scope :order_by_critic_stock, lambda { where(:critic_stock.lteq => :quantity) }
  scope :ordered, order:(:name)
    
  def min_stock?
    quantity <= min_stock
  end
  
  def critic_stock?
    quantity <= critic_stock    
  end
end
