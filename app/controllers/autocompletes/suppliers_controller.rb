class Autocompletes::SuppliersController < ApplicationController
  def index
    render json: AutocompleteSuppliersPresenter.new(params[:term])
  end
end