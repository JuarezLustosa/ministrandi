require 'spec_helper'

describe "clients/new" do
  before(:each) do
    assign(:client, stub_model(Client,
      :name => "MyString",
      :cnpj => 1,
      :cpf => 1,
      :social_reason => "MyString",
      :contact => "MyString",
      :email => "MyString",
      :phone1 => 1,
      :phone2 => 1,
      :address => nil
    ).as_new_record)
  end

  it "renders new client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", clients_path, "post" do
      assert_select "input#client_name[name=?]", "client[name]"
      assert_select "input#client_cnpj[name=?]", "client[cnpj]"
      assert_select "input#client_cpf[name=?]", "client[cpf]"
      assert_select "input#client_social_reason[name=?]", "client[social_reason]"
      assert_select "input#client_contact[name=?]", "client[contact]"
      assert_select "input#client_email[name=?]", "client[email]"
      assert_select "input#client_phone1[name=?]", "client[phone1]"
      assert_select "input#client_phone2[name=?]", "client[phone2]"
      assert_select "input#client_address[name=?]", "client[address]"
    end
  end
end
