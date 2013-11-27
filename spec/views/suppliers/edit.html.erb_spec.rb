require 'spec_helper'

describe "suppliers/edit" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :name => "MyString",
      :cnpj => 1,
      :fantasy => "MyString",
      :contact => "MyString",
      :email => "MyString",
      :phone1 => 1,
      :phone2 => 1,
      :state_scription => "MyString"
    ))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do
      assert_select "input#supplier_name[name=?]", "supplier[name]"
      assert_select "input#supplier_cnpj[name=?]", "supplier[cnpj]"
      assert_select "input#supplier_fantasy[name=?]", "supplier[fantasy]"
      assert_select "input#supplier_contact[name=?]", "supplier[contact]"
      assert_select "input#supplier_email[name=?]", "supplier[email]"
      assert_select "input#supplier_phone1[name=?]", "supplier[phone1]"
      assert_select "input#supplier_phone2[name=?]", "supplier[phone2]"
      assert_select "input#supplier_state_scription[name=?]", "supplier[state_scription]"
    end
  end
end
