class Orders::AttendingController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order.attending

    diferente_location @order
  end
  
  private
  
  def diferente_location order
    respond_with order, :location => order_items_path
  end
end
