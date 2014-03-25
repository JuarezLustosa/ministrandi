class Orders::ReadyController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order.ready

    diferente_location @order
  end
  
  private
  
  def diferente_location order
    redirect_to print_done_order_path(order)
  end
end
