class Feedstock::Output < ActiveRecord::Base
  attr_accessible :date, :status, :employee

  has_many :items, :class_name => "Feedstock::Output::Item", :dependent => :destroy  
  accepts_nested_attributes_for :items, :allow_destroy => true
    
  def finish
    transaction do
      items.each  do |item|
        ChangeStock.new(item.feedstock, item.quantity).deduct!
      end
      update_attributes status: "FINISHED"
    end
  end
end
