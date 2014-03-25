class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :print]
  before_action :set_orders, only: [:index]
  
  def attendances
    @orders = Order.opens
    @orders_attend = Order.attend
  end

  def new
    @order = Order.new
    respond_with(@order)
  end
    
  def show
    respond_with(@order)
  end

  def create
    @order = Order.new(order_params)
    @order.save
    respond_with_different_location(@order)
  end

  def update
    @order.update(order_params)
    respond_with_different_location(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end
  
  def print
    @orders = Order.all
    render :print, :layout => "report"
  end
  
  def print_done
    @order = Order.find(params[:id])
    render :print_done, :layout => "report"
  end
  
  
  private
  def respond_with_different_location(order)
    respond_with order,
      :location => order_items_path(order)
  end
  
  def set_order
    @order = Order.find(params[:id])
  end
  
  def set_orders
    @orders = Order.incompletes
  end
  
  def order_params
    params.require(:order).permit(:client_id, :user_id, :date)
  end
end
