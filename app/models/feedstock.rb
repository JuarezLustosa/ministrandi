class Feedstock < ActiveRecord::Base
  attr_accessible :id, :name, :weight, :critic_stock, :description, :med, :min_stock, :quantity
  
  validates_presence_of :name
  validates_uniqueness_of :name

  scope :search_by_name, lambda { |term| order(:name).where("name like ?", "#{term}%") }
  
  
  def min_stock?
    quantity <= min_stock
  end
  
  def critic_stock?
    quantity <= critic_stock    
  end
end
