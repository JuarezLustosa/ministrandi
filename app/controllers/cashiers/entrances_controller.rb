class Cashiers::EntrancesController < ApplicationController
  before_filter :build_new, :only => [:new, :create]
  
  def new
    respond_with @cashiers_entrance
  end
  
  def create
    @cashiers_entrance.save
    respond_with_diferent_location @cashiers_entrance
  end
  
  def respond_with_diferent_location cashiers_entrance
    respond_with cashiers_entrance #, :location => new_center_cost_path
  end
  
  def build_new
    @cashiers_entrance = Cashier::Entrance.new
    @cashiers_entrance = Cashier::Entrance.new(params[:cashier_entrance]) if params[:cashier_entrance].present?
  end
end
