class Feedstock::Entrance::Item < ActiveRecord::Base
  attr_accessible :quantity, :price_unit, :feedstock_id, :entrance_id
  
  belongs_to :feedstock, :class_name => "Feedstock", :foreign_key => "feedstock_id"
  belongs_to :entrance, :class_name => "Feedstock::Entrance", :foreign_key => 'entrance_id'
  delegate :name, :med, :weight, :to => :feedstock, prefix: true, allow_blank: true
  
  validates_presence_of :feedstock_id, :quantity, :price_unit
  
end
