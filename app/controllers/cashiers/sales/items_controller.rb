class Cashiers::Sales::ItemsController < ApplicationController
  respond_to :js
  before_filter :items, :cashier_opened, :only => [:index]
  
  def destroy
    @item = Cashier::Sale::Item.find(params[:id])
    @item.destroy
    
    respond_with @item 
  end
  
  def create
    @item = Cashier::Sale::Item.create!(sale_id: params[:sale_id], 
                                        quantity: params[:quantity],
                                        product_id: params[:product_id],
                                        unit_price: params[:unit_price])
              
    respond_with @item
  end

  private
  
  def items
    cashier_sale.items
  end
  
  def cashier_opened
    Cashier.open_to_day.first
  end
  
  def cashier_sale
    @cashier_sale ||= Cashier::Sale.find(params[:sale_id])
  end
  helper_method :cashier_sale, :items, :cashier_opened
end
