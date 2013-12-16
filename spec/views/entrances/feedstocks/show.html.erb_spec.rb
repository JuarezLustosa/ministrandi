require 'spec_helper'

describe "entrances/feedstocks/show" do
  before(:each) do
    @entrances_feedstock = assign(:entrances_feedstock, stub_model(Entrances::Feedstock,
      :supllier => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
