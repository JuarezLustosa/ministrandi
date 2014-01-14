class Feedstocks::Outputs::ItemsController < ApplicationController
  respond_to :js
  before_filter :items, :only => [:index]
  
  def destroy
    @item = Feedstock::Output::Item.find(params[:id])
    @item.destroy
    respond_with @item 
  end
  
  def create
    @item = Feedstock::Output::Item.create!(
              output_id: params[:output_id],
              feedstock_id: params[:feedstock_id],
              quantity: params[:quantity])
              
    respond_with(@item)
  end

  private

  def items
    feedstock_output.items
  end
    
  def feedstock_output
    @feedstock_output ||= Feedstock::Output.find(params[:output_id])
  end
  helper_method :feedstock_output, :items
end
