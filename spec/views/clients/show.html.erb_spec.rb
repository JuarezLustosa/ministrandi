require 'spec_helper'

describe "clients/show" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "Name",
      :cnpj => 1,
      :cpf => 2,
      :social_reason => "Social Reason",
      :contact => "Contact",
      :email => "Email",
      :phone1 => 3,
      :phone2 => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Social Reason/)
    rendered.should match(/Contact/)
    rendered.should match(/Email/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
