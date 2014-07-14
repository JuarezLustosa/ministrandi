class Feedstock::Entrance < ActiveRecord::Base
  attr_accessible :supplier_id, :date, :supplier, :status, :nf_number, :freight_price, :nf_key_access
  

  belongs_to :supplier, :class_name => "Supplier", :foreign_key => "supplier_id"
  has_many :items, :class_name => "Feedstock::Entrance::Item", :dependent => :destroy  
  
  delegate :name, :to => :supplier, allow_nil: true, prefix: true
  
  accepts_nested_attributes_for :items, :allow_destroy => true  
    
  validates_presence_of :supplier
  validates_uniqueness_of :nf_number
  
  def finish
    items.each  do |item|
      feedstock = item.feedstock
      quantity = feedstock.quantity + item.quantity
      feedstock.update_attributes(quantity: quantity)
    end
    self.update_attributes(status: "FINISHED")
  end
end
