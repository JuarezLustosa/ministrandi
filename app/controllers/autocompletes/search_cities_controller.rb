class Autocompletes::SearchCitiesController < ApplicationController
  def index
    render json: AutocompleteCitiesPresenter.new(params[:term])
  end
end