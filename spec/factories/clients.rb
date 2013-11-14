# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name "MyString"
    cnpj 1
    cpf 1
    social_reason "MyString"
    contact "MyString"
    email "MyString"
    phone1 1
    phone2 1
  end
end
