class Autocompletes::StockIndustriesController < ApplicationController
  def index
    render json: AutocompleteStockIndustryPresenter.new(params[:term], params[:payment_form])
  end
end