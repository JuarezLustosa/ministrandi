class Orders::ItemsController < ApplicationController
  respond_to :js
  before_filter :items, :only => [:index]
  
  def attendances
    order.items
  end
    
  def destroy
    @item = Order::Item.find(params[:id])
    @item.destroy
    respond_with @item 
  end
  
  def create
    @item = Order::Item.create!(
              order_id: params[:order_id],
              product_id: params[:product_id],
              quantity: params[:quantity], 
              unit_price: params[:unit_price],
              descount: params[:descount],
              total_price: params[:total_price])
              
    respond_with(@item)
  end

  private

  def items
    order.items
  end

  def order
    @order ||= Order.find(params[:order_id])
  end
  helper_method :order, :items
end