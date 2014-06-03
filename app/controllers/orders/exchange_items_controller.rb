class Orders::ExchangeItemsController < ApplicationController
  respond_to :js
  
  def create
    @exchange_item = Order::ExchangeItem.create!(
      order_id:   params[:order_id],
      product_id: params[:exchange_product_id],
      quantity:   params[:exchange_quantity] )
                            
    respond_with(@xchange_item)
  end
  
  def destroy
    @exchange_item = Order::ExchangeItem.find(params[:id])
    @exchange_item.destroy
    respond_with @exchange_item 
  end
  
  private 
  def exchange_items
    order.exchange_items
  end

  def order
    @order ||= Order.find(params[:order_id])
  end
  helper_method :order, :exchange_items
end
