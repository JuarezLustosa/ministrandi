# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    unit "MyString"
    barcode 1
    stock 1
    stock_minim 1
    stock_critic 1
    valid_date "2013-10-23"
    retail_price "9.99"
    wholesale "9.99"
  end
end
