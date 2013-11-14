# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock do
    product nil
    quantity 1
    local "MyString"
  end
end
