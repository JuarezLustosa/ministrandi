class Feedstock < ActiveRecord::Base
  attr_accessible :id, :name, :critic_stock, :description, :med, :min_stock, :quantity
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
