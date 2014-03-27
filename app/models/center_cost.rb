class CenterCost < ActiveRecord::Base
  has_ancestry
  
  attr_accessible :name, :parent_id
  
  validates_presence_of :name
  scope :ordered, order(:name)
  
  def move_possible?(target)
    self != target
  end
  
  def to_s
    name.to_s
  end
end
