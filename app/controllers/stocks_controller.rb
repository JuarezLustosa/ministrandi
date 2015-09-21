class StocksController < ApplicationController  
  respond_to :js
  before_action :set_stock, only: [:edit, :update, :destroy]

  def level
    @stocks = Stock.critic_stock.manufactury_location
    respond_with @stocks
  end

  def store_list
    @stocks = Stock.store_location
    respond_with @stocks
  end
  
  def change
    @stock = Stock.find(params[:stock_id])
    ChangeStock.new(@stock, params[:in].to_i).add! if params[:in]
    ChangeStock.new(@stock, params[:out].to_i).deduct! if params[:out]
    respond_with_diferent_location
  end
  
  def new
    @stock = Stock.new
    respond_with @stock
  end
  
  def create
    @stock = Stock.new(stock_params)
    @stock.save
    respond_with(@stock)
  end

  def edit
  end

  def update
    @stock.update(stock_params)
    respond_with_diferent_location
  end

  
  def index
    @stocks = Stock.manufactury_location.ordered_by_product_name
  end
  
  def destroy
    @stock.destroy
    respond_with_diferent_location
  end
  
  private
  def set_stock
    @stock = Stock.find(params[:id])
  end
    
  def stock_params
    params.require(:stock).permit(:product_id, :local, :quantity, :min_stock)
  end
  
  def respond_with_diferent_location
    respond_with @stock, location: stocks_path
  end
end
