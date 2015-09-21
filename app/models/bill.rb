class Bill < ActiveRecord::Base
  belongs_to :supplier

  attr_accessible :number, :description, :barcode, :state, :release, :payment_day, :category, :bank, :valor, :valor_paid, 
  				  :supplier_id, :center_cost_id,  :supplier, :feedstock_entrance_id

  state_machine initial: :payable do
    event :payment do
      transition :payable => :paid
    end
  end
end
