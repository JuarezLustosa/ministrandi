class Autocompletes::FeedstocksController < ApplicationController
  def index
    render json: AutocompleteFeedstocksPresenter.new(params[:term])
  end
end