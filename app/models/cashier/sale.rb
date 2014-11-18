class Cashier::Sale < ActiveRecord::Base
  before_save :save_total
  
  attr_accessible :state, :location, :entrances_attributes, :items_attributes, :payment, :money, :descount, :cashier_id, :total
  
  belongs_to :cashier
  has_many :items, :class_name => "Cashier::Sale::Item"

  validates_presence_of :cashier, :payment
  
  accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes['product_id'].blank? }

  scope :opened, -> { with_state(:open).where('DATE(created_at) = ?', Date.today) }

  state_machine initial: :open do
    event :finish do
      transition :open => :finish
    end
    
    after_transition :open => :finish do |sale|
      owner_class.create!
    end
  end
  
  def total_valor_items
    items.sum(:total_unit)
  end

  protected
  def self.create!
    create(cashier_id: Cashier.last_opened_id.last, payment: Cashiers::Sales::PaymentForm::CASH)
  end
  
  def save_total
    self.total = total_valor_items - descount
  end
end
