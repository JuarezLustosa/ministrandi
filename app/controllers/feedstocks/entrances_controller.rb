class Feedstocks::EntrancesController < ApplicationController
  before_action :set_entrance, only: [:show, :edit, :update, :destroy]

  def index
    @feedstock_entrances = Feedstock::Entrance.all
    respond_with(@feedstock_entrances)
  end

  def show
    respond_with(@feedstock_entrance)
  end

  def new
    @feedstock_entrance = Feedstock::Entrance.new
    respond_with(@feedstocks_entrance)
  end

  def create
    @feedstock_entrance = Feedstock::Entrance.new(entrance_params)
    @feedstock_entrance.save
    respond_with_different_location @feedstock_entrance
  end

  def update
    @feedstock_entrance.update(entrance_params)
    respond_with_different_location @feedstock_entrance 
  end

  def destroy
    @feedstock_entrance.destroy
    respond_with(@feedstock_entrance)
  end

  private
    def respond_with_different_location(feedstock_entrance)
      respond_with feedstock_entrance,
        :location => feedstocks_entrance_items_path(feedstock_entrance)
    end
    
    def set_entrance
      @feedstock_entrance = Feedstock::Entrance.find(params[:id])
    end

    def entrance_params
      params.require(:feedstock_entrance).permit(:supplier_id, :nf_number, :freight_price)
    end
    
    def form_path
      @feedstock_entrance.persisted? ? 
        feedstocks_entrance_path(@feedstock_entrance) : 
        feedstocks_entrances_path
    end
    helper_method :form_path
end