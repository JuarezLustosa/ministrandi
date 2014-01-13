class Feedstocks::Entrances::ItemsController < ApplicationController
  respond_to :js
  before_filter :items, :only => [:index]
    
  def delete
    @item = Feedstock::Entrance::Item.find(params[:id])
    @item.destroy
    respond_with @item 
  end
  
  def create
    @item = Feedstock::Entrance::Item.create!(
              entrance_id: params[:entrance_id],
              feedstock_id: params[:feedstock_id],
              quantity: params[:quantity], 
              price_unit: params[:price_unit])
              
    respond_with(@item)
  end

  private

  def items
    feedstock_entrance.items
  end

  def feedstock_entrance
    @feedstock_entrance ||= Feedstock::Entrance.find(params[:entrance_id])
  end
  helper_method :feedstock_entrance, :items
end