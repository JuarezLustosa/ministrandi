class Autocompletes::AddressesController < ApplicationController
  def index
    render json: AutocompleteAddressesPresenter.new(params[:term])
  end
end