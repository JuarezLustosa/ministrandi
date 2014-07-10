class CashiersController < ApplicationController
  before_filter :build_new, :only => [:new, :create]
  
  def new
    @cashier.entrances.build
    respond_with @cashier
  end
  
  def create
    @cashier.save
    respond_with_diferent_location @cashier
  end
  
  def respond_with_diferent_location cashiers_entrance
    respond_with cashiers_entrance, :location => root_path
  end
  
  private
  
  def cashier_params
    params.require(:cashier).permit(:location, entrances_attributes: [:money, :user_id] )
  end

  def build_new
    @cashier = Cashier.new
    @cashier = Cashier.new(cashier_params) if params[:cashier].present?
  end
end
