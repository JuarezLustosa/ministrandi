class CenterCostsController < ApplicationController
  before_filter :build_new, :only => [:new, :create]
  before_filter :find_center_cost, :only => [:update, :destroy, :edit]
  
  def index
    @center_costs = CenterCost.ordered
    respond_with(@center_costs)
  end

  def new
    respond_with(@center_cost)
  end

  def create
    @center_cost.save
    respond_with_diferent_location(@center_cost)
  end

  def update
    @center_cost.update_attributes(params[:center_cost])
    respond_with_diferent_location(@center_cost)
  end

  def destroy
    @center_cost.destroy
    respond_with(@center_cost)
  end
  
  private
  def respond_with_diferent_location center_cost
    respond_with center_cost, :location => new_center_cost_path
  end
  
  def build_new
    @center_cost = CenterCost.new
    @center_cost = CenterCost.new(params[:center_cost]) if params[:center_cost].present?
  end
  
  def find_center_cost
    @center_cost = CenterCost.find(params[:id])
  end
end
