require 'spec_helper'

describe "suppliers/show" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :name => "Name",
      :cnpj => 1,
      :fantasy => "Fantasy",
      :contact => "Contact",
      :email => "Email",
      :phone1 => 2,
      :phone2 => 3,
      :state_scription => "State Scription"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Fantasy/)
    rendered.should match(/Contact/)
    rendered.should match(/Email/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/State Scription/)
  end
end
