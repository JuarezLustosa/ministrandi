class Autocompletes::StockIndustriesController < ApplicationController
  def index
    render json: AutocompleteStockIndustryPresenter.new(params[:term])
  end
end