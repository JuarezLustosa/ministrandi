class StocksController < ApplicationController  
  respond_to :js

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
  end
  
  def create
    @stock = Stock.new(stock_params)
    @stock.save
    respond_with_diferent_location
  end
  
  def index
    @stocks = Stock.all.ordered_by_product_name
  end
  
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    respond_with_diferent_location
  end
  
  private
    
  def stock_params
    params.require(:stock).permit(:product_id, :local, :quantity)
  end
  
  def respond_with_diferent_location
    respond_with @stock, location: stocks_path
  end
end
