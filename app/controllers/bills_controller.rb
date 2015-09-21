class BillsController < ApplicationController
	before_filter :build_new, :only => [:new, :create]

	def index
		@bills = Bill.all
	end

	def create
		@bill.save
		respond_with @bill		
	end

	private
  def build_new
    @bill = Bill.new
    @bill = Bill.new(bill_params) if bill_params.present?
  end

   def bill_params
    params.require(:bill).permit(:number, :description, :barcode, :state, :release, 
    														 :payment_day, :category, :bank, :valor, :valor_paid, 
  				  										 :supplier_id, :center_cost_id, :feedstock_entrance_id) if params[:bill].present?
  end
end
