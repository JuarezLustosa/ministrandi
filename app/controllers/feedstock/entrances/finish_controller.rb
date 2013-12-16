class Feedstock::Entrances::FinishController < ApplicationController
  def update
    @feedstock_entrance = Feedstock::Entrance.find(params[:entrance_id])
    @feedstock_entrance.finish

    diferente_location @feedstock_entrance
  end
  
  private
  
  def diferente_location feedstock_entrance
    respond_with feedstock_entrance, :location => feedstock_entrances_path
  end
end
