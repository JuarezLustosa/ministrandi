class Reports::ComissionsController < ApplicationController
  respond_to :js

  def index
    month = params[:date][:month] if params[:date].present?
    @comissions = Order.not_canceled.comission(params[:vendor_id]).by_month(month)
    respond_with @commissions
  end
end
