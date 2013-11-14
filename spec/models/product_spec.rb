require 'spec_helper'

describe Product do
  let(:product) { Product.new(:name => 'Mel') }
  context "validations" do
    it "should be valid" do
      product.save
      product.should be_valid
    end
  end
    
  context "should be invalid" do
    it "with name is nil" do
      product.name = ""
      product.save
      product.should be_invalid
    end
  end
end
