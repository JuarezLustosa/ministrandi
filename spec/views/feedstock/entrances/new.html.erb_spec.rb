require 'spec_helper'

describe "feedstock/entrances/new" do
  before(:each) do
    assign(:feedstock_entrance, stub_model(Feedstock::Entrance,
      :supplier => nil,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new feedstock_entrance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feedstock_entrances_path, "post" do
      assert_select "input#feedstock_entrance_supplier[name=?]", "feedstock_entrance[supplier]"
      assert_select "input#feedstock_entrance_status[name=?]", "feedstock_entrance[status]"
    end
  end
end
