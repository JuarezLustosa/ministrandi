class Cashiers::EntrancesController < ApplicationController
  before_filter :build_new, :only => [:create]
  respond_to :js
    
  def create
    @cashiers_entrance.cashier_id = cashier_id
    @cashiers_entrance.save
    respond_with @cashiers_entrance
  end
    
  private
  
  def cashier_entrance_params
    params.require(:cashier_entrance).permit(:money, :user_id, :cashier_id)
  end
  
  def cashier_id
    Cashier.last_opened_id.first
  end
  
  def build_new
    @cashiers_entrance = Cashier::Entrance.new(cashier_entrance_params)
  end
end
