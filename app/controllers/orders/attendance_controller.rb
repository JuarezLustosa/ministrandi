class Orders::AttendanceController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order.attendance

    diferente_location @order
  end
  
  private
  
  def diferente_location order
    redirect_to print_order_path(order)
  end
end
