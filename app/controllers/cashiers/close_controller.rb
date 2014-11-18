class Cashiers::CloseController < ApplicationController
  def update
    @cashier = Cashier.find(params[:cashier_id])
    @cashier.close

    diferente_location @cashier
  end
  
  private
  def diferente_location cashier
    respond_with cashier, :location => daily_sale_report_cashier_path(cashier)
  end
end