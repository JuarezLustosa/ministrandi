class Reports::SalesController < ApplicationController
  respond_to :js

  def index
    month = params[:date][:month] if params[:date].present?
    @sales = Order.not_canceled.by_month(month).ordered_by_date
    respond_with @sales
  end
end
