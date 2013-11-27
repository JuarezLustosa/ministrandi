require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :cnpj => 1,
        :cpf => 2,
        :social_reason => "Social Reason",
        :contact => "Contact",
        :email => "Email",
        :phone1 => 3,
        :phone2 => 4,
        :address => nil
      ),
      stub_model(Client,
        :name => "Name",
        :cnpj => 1,
        :cpf => 2,
        :social_reason => "Social Reason",
        :contact => "Contact",
        :email => "Email",
        :phone1 => 3,
        :phone2 => 4,
        :address => nil
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Social Reason".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
