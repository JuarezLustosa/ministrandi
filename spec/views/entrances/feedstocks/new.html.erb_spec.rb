require 'spec_helper'

describe "entrances/feedstocks/new" do
  before(:each) do
    assign(:entrances_feedstock, stub_model(Entrances::Feedstock,
      :supllier => ""
    ).as_new_record)
  end

  it "renders new entrances_feedstock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entrances_feedstocks_path, "post" do
      assert_select "input#entrances_feedstock_supllier[name=?]", "entrances_feedstock[supllier]"
    end
  end
end
