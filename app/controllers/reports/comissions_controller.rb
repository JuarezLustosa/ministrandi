class Reports::ComissionsController < ApplicationController
  respond_to :js

  def index
    month = params[:date][:month] if params[:date].present?
    year = params[:date][:year] if params[:date].present?
    @comissions = Order.not_canceled.comission(params[:vendor_id]).by_month_year(month, year).ordered_by_date
    respond_with @commissions
  end
end
