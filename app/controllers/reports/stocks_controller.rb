class Reports::StocksController < ApplicationController
  respond_to :js

  def index
    @month = params[:date][:month] if params[:date].present?
    @year = params[:date][:year] if params[:date].present?
    @products = Product.ordered

    respond_with @products
  end
end
