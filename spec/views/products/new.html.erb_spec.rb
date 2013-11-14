require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :unit => "MyString",
      :barcode => 1,
      :retail_price => "9.99",
      :wholesale => "9.99"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_unit[name=?]", "product[unit]"
      assert_select "input#product_barcode[name=?]", "product[barcode]"
      assert_select "input#product_retail_price[name=?]", "product[retail_price]"
      assert_select "input#product_wholesale[name=?]", "product[wholesale]"
    end
  end
end
