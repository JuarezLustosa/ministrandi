class Autocompletes::StockStoresController < ApplicationController
  def index
    render json: AutocompleteStockStorePresenter.new(params[:term])
  end
end