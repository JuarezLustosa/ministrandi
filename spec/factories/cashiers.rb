# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cashier do
    type 1
    state "MyString"
    date "2014-06-30"
  end
end
