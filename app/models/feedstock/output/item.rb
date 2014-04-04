class Feedstock::Output::Item < ActiveRecord::Base
  attr_accessible :quantity, :feedstock_id, :output_id
  
  belongs_to :feedstock, :class_name => "Feedstock", :foreign_key => "feedstock_id"
  belongs_to :output, :class_name => "Feedstock::Output", :foreign_key => "output_id"
  delegate :name, :med, :weight, :quantity, :to => :feedstock, prefix: true, allow_blank: true
  
  validates_presence_of :feedstock_id, :quantity
  
  def negative?
    result = feedstock.quantity - quantity
    result < 0
  end
end
