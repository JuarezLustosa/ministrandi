class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    @products = Product.all
    render :print_industry_price, :layout => "report"
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
    :measurement_unit)
  end
end
