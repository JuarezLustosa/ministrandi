class ProductsController < ApplicationController
  respond_to :js
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def find_by_barcode
    @product = Product.find_by_barcode(params[:term])
  end
  
  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with_diferent_location(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end
  
  def print_industry_price
    @fathers_product_groups = Product::Group.roots
    render :print_industry_price
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
    
  def respond_with_diferent_location product
    respond_with product, :location => new_product_path
  end

  def product_params
    params.require(:product).permit(:name, 
    :unit, :barcode, :stock, :stock_minim, :stock_critic, :valid_date, :retail_price, :wholesale, :cod,
    :measurement_unit, :group_id, :wholesale_term)
  end
end
