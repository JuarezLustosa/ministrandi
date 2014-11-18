class Cashier < ActiveRecord::Base
  has_enumeration_for :location, :with => Cashiers::Locations, :create_helpers => true, :create_scopes => true
  
  attr_accessible :state, :location, :entrances_attributes
  has_many :outs, :class_name => "Cashier::Out"
  has_many :entrances, :class_name => "Cashier::Entrance"
  has_many :sales, :class_name => "Cashier::Sale"

  validates_presence_of :entrances, :location
  accepts_nested_attributes_for :entrances, reject_if: proc { |attributes| attributes['money'].blank? }
  validate :has_cashier_opened?, :on => :create
  
  scope :opened, -> { with_state(:open) }
  scope :open_to_day, -> { opened.where('DATE(created_at) = ?', Date.today)}
  scope :last_opened_id, -> { open_to_day.pluck(:id) }
    
  state_machine initial: :open do
    event :close do
      transition :open => :close
    end
  end
      
  def sum_total_sale
    sales.sum(:total)
  end
  
  def sum_total_out
    outs.sum(:money)
  end
  
  def sum_total_entrance
    entrances.sum(:money)
  end
  
  def total_money_in_cashier
    sum_total_sale_in_cash + sum_total_entrance - sum_total_out
  end
  
  def sum_total_sale_in_cash
    sales.where(:payment => Cashiers::Sales::PaymentForm::CASH).sum(:total)
  end
  
  def sum_total_sale_in_credit_card
    sales.where(:payment => Cashiers::Sales::PaymentForm::CREDIT_CARD).sum(:total)
  end

  def has_cashier_opened?
    errors.add(:location, "Você possui um caixa aberto, favor fechar antes de abrir outro") if self.class.open_to_day.any?
  end
end


# EventsVisitor
#       .select('count(*) as count, events_visitors.*')
#       .joins(:visitor)
#       .order(order)
#       .where(:event_id => params[:event_id])
#       .where(filter_search)
#       .where(mode)
#       .first()
#       .count

