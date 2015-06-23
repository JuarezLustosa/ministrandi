class Order < ActiveRecord::Base
  has_enumeration_for :priority, :with => Orders::Priority
  has_enumeration_for :payment, :with => Orders::Payments
  has_enumeration_for :nature, :with => Orders::Natures
  before_save :save_total
  
  has_many :items, :class_name => "Order::Item"
  has_many :exchange_items, :class_name => "Order::ExchangeItem"
  belongs_to :vendor, :class_name => "User", :foreign_key => :user_id
  belongs_to :client, :class_name => "Client", :foreign_key => :client_id
  
  scope :incompletes, -> { with_state(:incomplete) }
  scope :opens, -> { with_state(:open) }
  scope :delivered, -> { with_state(:delivered) }
  scope :attend, -> { with_state(:attending) }
  scope :ready, -> { with_state(:ready).order(:id) }

  scope :comission, lambda { |vendor| joins(:vendor).where(:nature => Orders::Natures::SALE).where( :users => {:id => vendor})}
  scope :by_month_year, lambda { |month, year| where('extract(month from date) = ? AND extract(year from date) = ? ', month, year) }
  scope :not_canceled, -> {where('orders.state NOT IN (?)','cancel')}
  scope :total, -> {sum(:total)}
  scope :ordered_by_date, -> { order(:date)}
  scope :search_by_client_name, 
    lambda { |client_name| joins(:client).where('name ILIKE ?', "#{client_name}%")}
 
  attr_accessible :client, :client_id, :vendor, :user_id, :date, :nature,
                  :priority, :nf, :state, :descount, :payment, :payment_day
  
  delegate :name,  :to => :vendor, allow_nil: true, prefix: true
  delegate :name, :city_name, :fantasy_name, :address_complete, :to => :client, allow_nil: true, prefix: true
  
  validates_presence_of :vendor, :client, :date, :payment
  validates_presence_of :payment_day, unless: :money?
    
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
  
  def payment_day_to_s
    "#{payment_day} dia(s)" unless money? 
  end
  
  def money?
    payment === Orders::Payments::MONEY
  end
  
  #TODO inserir em uma querry  
  def total_valor_items
    items.sum(:total_price)
  end
  
  def save_total
    self.total = total_valor_items - descount
  end
  
  def add collection
    collection.each do |item|
      ChangeStock.new(item.product_stock, item.quantity).add!
    end
  end
  
  def has_descount?
    descount > 0
  end
  
  def deduct collection
    collection.each do |item|
      ChangeStock.new(item.product_stock, item.quantity).deduct!
    end
  end
end