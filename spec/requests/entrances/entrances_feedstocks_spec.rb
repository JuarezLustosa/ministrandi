require 'spec_helper'

describe "Entrances::Feedstocks" do
  describe "GET /entrances_feedstocks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get entrances_feedstocks_path
      response.status.should be(200)
    end
  end
end
