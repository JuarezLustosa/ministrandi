require 'spec_helper'

describe "suppliers/index" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier,
        :name => "Name",
        :cnpj => 1,
        :fantasy => "Fantasy",
        :contact => "Contact",
        :email => "Email",
        :phone1 => 2,
        :phone2 => 3,
        :state_scription => "State Scription"
      ),
      stub_model(Supplier,
        :name => "Name",
        :cnpj => 1,
        :fantasy => "Fantasy",
        :contact => "Contact",
        :email => "Email",
        :phone1 => 2,
        :phone2 => 3,
        :state_scription => "State Scription"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Fantasy".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "State Scription".to_s, :count => 2
  end
end
