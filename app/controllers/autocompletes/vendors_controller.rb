class Autocompletes::VendorsController < ApplicationController
  def index
    render json: AutocompleteVendorsPresenter.new(params[:term])
  end
end