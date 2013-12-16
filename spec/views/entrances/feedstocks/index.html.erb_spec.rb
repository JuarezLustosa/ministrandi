require 'spec_helper'

describe "entrances/feedstocks/index" do
  before(:each) do
    assign(:entrances_feedstocks, [
      stub_model(Entrances::Feedstock,
        :supllier => ""
      ),
      stub_model(Entrances::Feedstock,
        :supllier => ""
      )
    ])
  end

  it "renders a list of entrances/feedstocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
