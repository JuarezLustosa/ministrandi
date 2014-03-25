class Order < ActiveRecord::Base
  belongs_to :vendor, :class_name => "User", :foreign_key => :user_id
  belongs_to :client, :class_name => "Client", :foreign_key => :client_id
  attr_accessible :client, :client_id, :vendor, :user_id, :date
  
  delegate :name,  to: :vendor, allow_nil: true, prefix: true
  delegate :name,  to: :client, allow_nil: true, prefix: true
  
  validates_presence_of :vendor, :client, :date
  
  has_many :items, :class_name => "Order::Item"
  
  scope :incompletes, -> { with_state(:incomplete) }
  scope :opens, -> { with_state(:open) }
  scope :attend, -> { with_state(:attending) }
  
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

    before_transition :attending => :ready do |order|
      order.items.each do |item|
        ChangeStock.new(item.product_stock, item).deduct!
      end
    end    
  end
  
  def total_valor
    items.sum(:total_price)
  end
end
