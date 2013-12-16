class Feedstock::Output < ActiveRecord::Base
  attr_accessible :date, :status, :employee

  has_many :items, :class_name => "Feedstock::Output::Item", :dependent => :destroy  
  accepts_nested_attributes_for :items, :allow_destroy => true    
  
  def finish
    items.each  do |item|
      feedstock = item.feedstock
      quantity = feedstock.quantity - item.quantity
      feedstock.update_attributes(quantity: quantity)
    end
    self.update_attributes(status: "FINISHED")
  end
end
