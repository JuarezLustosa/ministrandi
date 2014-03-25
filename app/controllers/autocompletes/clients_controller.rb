class Autocompletes::ClientsController < ApplicationController
  def index
    render json: AutocompleteClientsPresenter.new(params[:term])
  end
end