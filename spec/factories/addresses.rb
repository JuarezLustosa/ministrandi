# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    cep 1
    street_type 1
    street "MyString"
    number 1
    complement "MyString"
    neighborhood "MyString"
    city 1
    state 1
  end
end
