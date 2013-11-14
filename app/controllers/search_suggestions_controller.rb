class SearchSuggestionsController < ApplicationController
  def index
    render json: AutocompleteProductsPresenter.new(params[:term])
  end
end
