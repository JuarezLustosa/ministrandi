class Reports::ClientsController < ApplicationController
  respond_to :js

  def index
    @clients = Client.order_by_name
  end
end