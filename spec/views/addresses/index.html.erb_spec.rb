require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :cep => 1,
        :street_type => 2,
        :street => "Street",
        :number => 3,
        :complement => "Complement",
        :neighborhood => "Neighborhood",
        :city => 4,
        :state => 5
      ),
      stub_model(Address,
        :cep => 1,
        :street_type => 2,
        :street => "Street",
        :number => 3,
        :complement => "Complement",
        :neighborhood => "Neighborhood",
        :city => 4,
        :state => 5
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Complement".to_s, :count => 2
    assert_select "tr>td", :text => "Neighborhood".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
