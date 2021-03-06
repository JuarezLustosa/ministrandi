class Client < ActiveRecord::Base
  attr_accessible :name, :cnpj, :cpf, 
                  :contact, :email, 
                  :phone1, :phone2, :fantasy_name, 
                  :city_inscription, :state_inscription, :person,
                  :address_attributes, :vendor, :user_id, :info, :inactive
                  
  has_one :address
  has_many :orders, :class_name => "Order"
  belongs_to :vendor, :class_name => "User", :foreign_key => :user_id
  
  accepts_nested_attributes_for :address
  
  validates_presence_of :address, :name, :cnpj
  validates_uniqueness_of :cnpj
  
  delegate :city_name, :neighborhood, :to => :address, allow_nil: true
  delegate :city_name, :complete, :to => :address, allow_nil: true, prefix: true
  delegate :name, :id, :complete, :to => :vendor, allow_nil: true, prefix: true

  scope :search_by_name, lambda { |term| order(:name).where('name ILIKE ? OR fantasy_name ILIKE ?', "#{term}%", "#{term}%") }
  scope :order_by_name, order(:name)

  def date_last_buy
    orders.last ? I18n.l(orders.last.date) : "Não possui registro de compra"
  end  
end
