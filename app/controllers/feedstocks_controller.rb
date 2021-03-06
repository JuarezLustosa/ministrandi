class FeedstocksController < ApplicationController
  def index
    @feedstocks = Feedstock.ordered
    respond_with(@feedstocks)
  end

  def show
    @feedstock = Feedstock.find(params[:id])
    @feedstock_entrance_items = @feedstock.entrances_items
    respond_with(@feedstock)
  end

  def new
    @feedstock = Feedstock.new
    respond_with(@feedstock)
  end

  def edit
    @feedstock = Feedstock.find(params[:id])
  end

  def create
    @feedstock = Feedstock.new(params[:feedstock])
    @feedstock.save
    respond_with(@feedstock)
  end

  def update
    @feedstock = Feedstock.find(params[:id])
    @feedstock.update_attributes(params[:feedstock])
    respond_with(@feedstock)
  end

  def destroy
    @feedstock = Feedstock.find(params[:id])
    @feedstock.destroy
    respond_with(@feedstock)
  end
  
  def print_inventory
    @feedstocks = Feedstock.ordered
    render :print_inventory
  end
  
  def list_critic_stock
    @feedstocks = Feedstock.order_by_critic_stock
    respond_with(@feedstocks)
  end
end
