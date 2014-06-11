class City < ActiveRecord::Base
  attr_accessible :name
  belongs_to :state
  
  scope :search_by_name, lambda { |term| order(:name).where("name ILIKE ?", "#{term}%") }
end
