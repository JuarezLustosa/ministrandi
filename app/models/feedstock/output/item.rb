class Feedstock::Output::Item < ActiveRecord::Base
  attr_accessible :quantity, :feedstock_id, :output_id
  
  belongs_to :feedstock, :class_name => "Feedstock", :foreign_key => "feedstock_id"
  belongs_to :output, :class_name => "Feedstock::Output", :foreign_key => "output_id"
  delegate :name, :med, :weight, :to => :feedstock, prefix: true, allow_blank: true
end
