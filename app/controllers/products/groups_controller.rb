class Products::GroupsController < ApplicationController
  before_filter :build_new, :only => [:new, :create]
  before_filter :find_group, :only => [:update, :destroy, :edit]

  def index
    @groups = Product::Group.all
    respond_with(@groups)
  end

  def new
    respond_with(@group)
  end

  def create
    @group.save
    respond_with_diferent_location(@group)
  end

  def update
    @group.update_attributes(params[:product_group])
    respond_with_diferent_location(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end

  private
  def respond_with_diferent_location group
    respond_with group, :location => new_products_group_path
  end

  def build_new
    @group = Product::Group.new
    @group = Product::Group.new(params[:product_group]) if params[:product_group].present?
  end

  def find_group
    @group = Product::Group.find(params[:id])
  end
end
