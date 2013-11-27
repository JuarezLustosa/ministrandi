# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postal_code do
     ""
    neighborhood "MyString"
    street_type 1
    street "MyString"
    cep 1
  end
end
