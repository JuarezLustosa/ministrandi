class Autocompletes::ProductsController < ApplicationController
  def index
    render json: AutocompleteProductsPresenter.new(params[:term])
  end
end