class Cashiers::Sales::FinishController < ApplicationController
  def update
    @cashier_sale = Cashier::Sale.find(params[:sale_id])
    @cashier_sale.finish

    diferente_location @cashier_sale
  end
  
  private
  def diferente_location cashier_sale
    next_sale = Cashier::Sale.open_today.first
    respond_with next_sale, cashier_sale, :location => cashiers_sale_items_path(next_sale.id)
  end
end