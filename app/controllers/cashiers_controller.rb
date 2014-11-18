class CashiersController < ApplicationController
  before_filter :build_new, :only => [:new, :create, :daily_sale_report]
  
  def index
    @cashiers = Cashier.opened  
    respond_with @cashiers
  end
  
  def new
    @cashier.entrances.build
    respond_with @cashier
  end
  
  def create
    if @cashier.save
      last_sale.update(cashier_id: @cashier.id) if last_sale.present?
      respond_with_diferent_location @cashier, last_sale
    else
      respond_with @cashier
    end
  end
  
  def daily_sale_report
    @cashier = Cashier.find(params[:id])
    respond_with @cashier
  end
  
  def respond_with_diferent_location cashier, last_sale 
    respond_with cashier, last_sale, :location => cashiers_sale_items_path(last_sale)
  end

  private
  def last_sale
    Cashier::Sale.opened.last
  end
  
  def cashier_params
    params.require(:cashier).permit(:location, entrances_attributes: [:money, :user_id] )
  end
  
  def build_new
    @cashier = Cashier.new
    @cashier = Cashier.new(cashier_params) if params[:cashier].present?
  end
end
