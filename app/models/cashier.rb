class Cashier < ActiveRecord::Base
  has_enumeration_for :location, :with => Cashiers::Locations, :create_helpers => true, :create_scopes => true
  
  attr_accessible :state, :location, :entrances_attributes
  has_many :entrances, :class_name => "Cashier::Entrance"

  validates_presence_of :entrances, :location
  accepts_nested_attributes_for :entrances, reject_if: proc { |attributes| attributes['money'].blank? }
  
  state_machine initial: :open do
    event :close do
      transition :open => :close
    end
  end
end
