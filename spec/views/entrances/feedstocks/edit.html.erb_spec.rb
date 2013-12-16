require 'spec_helper'

describe "entrances/feedstocks/edit" do
  before(:each) do
    @entrances_feedstock = assign(:entrances_feedstock, stub_model(Entrances::Feedstock,
      :supllier => ""
    ))
  end

  it "renders the edit entrances_feedstock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entrances_feedstock_path(@entrances_feedstock), "post" do
      assert_select "input#entrances_feedstock_supllier[name=?]", "entrances_feedstock[supllier]"
    end
  end
end
