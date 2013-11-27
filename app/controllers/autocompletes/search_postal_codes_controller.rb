class Autocompletes::SearchPostalCodesController < ApplicationController
  def index
    render json: AutocompletePostalCodesPresenter.new(params[:term])
  end
end