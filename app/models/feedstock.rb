class Feedstock < ActiveRecord::Base
  attr_accessible :id, :name, :weight, :critic_stock, :description, :med, :min_stock, :quantity
  
  validates_presence_of :name
  validates_uniqueness_of :name

  scope :search_by_name, lambda { |term| order(:name).where("name like ?", "#{term}%") }
end
