require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :cep => 1,
      :street_type => 2,
      :street => "Street",
      :number => 3,
      :complement => "Complement",
      :neighborhood => "Neighborhood",
      :city => 4,
      :state => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Street/)
    rendered.should match(/3/)
    rendered.should match(/Complement/)
    rendered.should match(/Neighborhood/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
