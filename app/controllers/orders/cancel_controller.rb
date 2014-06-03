class Orders::CancelController < ApplicationController
  respond_to :js
  
  def update
    @order = Order.find(params[:order_id])
    @order.cancel

    respond_with @order
  end
  
  private
  
  def ready_orders
    @orders = Order.ready
  end
  helper_method :ready_orders
end