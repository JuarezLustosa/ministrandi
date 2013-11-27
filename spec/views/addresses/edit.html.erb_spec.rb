require 'spec_helper'

describe "addresses/edit" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :cep => 1,
      :street_type => 1,
      :street => "MyString",
      :number => 1,
      :complement => "MyString",
      :neighborhood => "MyString",
      :city => 1,
      :state => 1
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", address_path(@address), "post" do
      assert_select "input#address_cep[name=?]", "address[cep]"
      assert_select "input#address_street_type[name=?]", "address[street_type]"
      assert_select "input#address_street[name=?]", "address[street]"
      assert_select "input#address_number[name=?]", "address[number]"
      assert_select "input#address_complement[name=?]", "address[complement]"
      assert_select "input#address_neighborhood[name=?]", "address[neighborhood]"
      assert_select "input#address_city[name=?]", "address[city]"
      assert_select "input#address_state[name=?]", "address[state]"
    end
  end
end
