class Cashier::Sale::Items < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
end