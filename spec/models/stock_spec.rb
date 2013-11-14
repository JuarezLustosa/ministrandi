require 'spec_helper'

describe Stock do
  let(:stock) { Stock.new(product_id: 1, quantity:10, local: "industria") }
  context "validations" do
    it "be valid" do
      stock.should be_valid
    end
    
    it "requires product_id" do
      stock.product_id = nil
      stock.should have(1).error_on(:product_id)
    end
  end
end
