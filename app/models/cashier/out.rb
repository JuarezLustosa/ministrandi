class Cashier::Out < ActiveRecord::Base
  belongs_to :cashier, :class_name => "Cashier", :foreign_key => "cashier_id"
  belongs_to :user, :class_name => "User", :foreign_key => :user_id
  
  attr_accessible :money, :user, :user_id, :cashier_id
  
  validates_presence_of :money, :user_id
end
