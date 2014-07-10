class Cashier::Sale < ActiveRecord::Base
  attr_accessible :state, :location, :entrances_attributes
  
  belongs_to :cashier
  has_many :items, :class_name => "Cashier::Sale::Item"
  
  accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes['product_id'].blank? }
end
