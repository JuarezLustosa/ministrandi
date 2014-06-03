class Order < ActiveRecord::Base
  has_enumeration_for :priority, :with => Orders::Priority
  
  scope :incompletes, -> { with_state(:incomplete) }
  scope :opens, -> { with_state(:open) }
  belongs_to :vendor, :class_name => "User", :foreign_key => :user_id
  belongs_to :client, :class_name => "Client", :foreign_key => :client_id
  attr_accessible :client, :client_id, :vendor, :user_id, :date, :priority, :nf, :state
  
  delegate :name,  :to => :vendor, allow_nil: true, prefix: true
  delegate :name, :city_name,  :to => :client, allow_nil: true, prefix: true
  
  validates_presence_of :vendor, :client, :date
  
  has_many :items, :class_name => "Order::Item"
  has_many :exchange_items, :class_name => "Order::ExchangeItem"

  scope :attend, -> { with_state(:attending) }
  scope :ready, -> { with_state(:ready) }
  
  state_machine initial: :incomplete do
    event :attendance do
      transition :incomplete => :open
    end
    
    event :attending do
      transition :open => :attending
    end
    
    event :ready do
      transition :attending => :ready
    end
    
    event :deliver do
      transition :ready => :delivered
    end
    
    event :cancel do
      transition :ready => :cancel
    end
    
    before_transition :ready => :cancel do |order|
      order.add order.items
      order.add order.exchange_items
    end

    before_transition :attending => :ready do |order|
      order.deduct order.items
      order.deduct order.exchange_items
    end    
  end
    
  def total_valor
    items.sum(:total_price)
  end
  
  def add collection
    collection.each do |item|
      ChangeStock.new(item.product_stock, item.quantity).add!
    end
  end
  
  def deduct collection
    collection.each do |item|
      ChangeStock.new(item.product_stock, item.quantity).deduct!
    end
  end
end
