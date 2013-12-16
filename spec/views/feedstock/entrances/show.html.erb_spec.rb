require 'spec_helper'

describe "feedstock/entrances/show" do
  before(:each) do
    @feedstock_entrance = assign(:feedstock_entrance, stub_model(Feedstock::Entrance,
      :supplier => nil,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Status/)
  end
end
