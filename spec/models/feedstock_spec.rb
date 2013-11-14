require 'spec_helper'

describe Feedstock do
  let(:feedstock) { Feedstock.new(:name => 'Mel') }
  context "validations" do
    it "should be valid" do
      feedstock.save
      feedstock.should be_valid
    end
    
    context "should be invalid" do
      it "with name is nil" do
        feedstock.name = ""
        feedstock.save
        feedstock.should be_invalid
      end
      
      xit "should validate uniqueness on name" do
        feedstock.save
        feedstock.save
        feedstock.should be_invalid
      end
    end
  end
end