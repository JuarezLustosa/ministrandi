class Cashiers::SalesController < ApplicationController
  respond_to :js
  
  def new
    @cashier_sale = cashier_sale_opened || Cashier::Sale.create!
    redirect_to switch_path_by_cashier_open @cashier_sale
  end
    
  def edit
    @cashier_sale = Cashier::Sale.find(params[:id])
  end
  
  def update
    @cashier_sale = Cashier::Sale.find(params[:id])
    @cashier_sale.update(params[:cashier_sale])
    respond_with(@cashier_sale)
  end
    
  def respond_with_diferent_location cashier_sale
    respond_with cashier_sale, :location => edit_cashiers_sale_path(cashier_sale)
  end
    
  private
  
  def cashier_sale
    @cashier_sale ||= Cashier::Sale.find(params[:sale_id])
  end
    
  def items
    @cashier_sale.items
  end
  
  def cashier_sale_opened
    @cashier_sale_opened = Cashier::Sale.opened.first
  end
  
  def switch_path_by_cashier_open(cashier_sale)
    cashier_sale.new_record? ? new_cashier_path : cashiers_sale_items_path(cashier_sale)
  end
  
  helper_method :items, :cashier_sale_opened, :cashier_sale
end
