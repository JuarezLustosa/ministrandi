# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    product nil
    user nil
    quantity 1
    price 1.5
    client nil
    status "MyString"
    descount 1
    total 1
    payment ""
  end
end
