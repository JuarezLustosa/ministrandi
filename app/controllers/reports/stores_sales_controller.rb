class Reports::StoresSalesController < ApplicationController
  respond_to :js

  def index
    month = params[:date][:month] if params[:date].present?
    @cashiers = Cashier.by_month(month).ordered_by_date
    respond_with @cashiers
  end
end
