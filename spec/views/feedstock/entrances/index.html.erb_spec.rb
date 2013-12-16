require 'spec_helper'

describe "feedstock/entrances/index" do
  before(:each) do
    assign(:feedstock_entrances, [
      stub_model(Feedstock::Entrance,
        :supplier => nil,
        :status => "Status"
      ),
      stub_model(Feedstock::Entrance,
        :supplier => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of feedstock/entrances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
