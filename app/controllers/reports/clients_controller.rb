class Reports::ClientsController < ApplicationController
  respond_to :js

  def index
    @clients = Client.all
  end
end