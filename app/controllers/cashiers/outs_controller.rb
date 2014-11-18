class Cashiers::OutsController < ApplicationController
  before_filter :build_new, :only => [:create]
  respond_to :js
    
  def create
    @cashiers_out.cashier_id = cashier_id
    @cashiers_out.save
    respond_with @cashiers_out
  end
    
  private
  
  def cashier_out_params
    params.require(:cashier_out).permit(:money, :user_id, :cashier_id)
  end
  
  def cashier_id
    Cashier.last_opened_id.first
  end
  
  def build_new
    @cashiers_out = Cashier::Out.new(cashier_out_params)
  end
end
