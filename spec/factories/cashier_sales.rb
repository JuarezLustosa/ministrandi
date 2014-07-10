# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cashier_sale, :class => 'Cashier::Sale' do
    cashier nil
    payment 1
    valor "9.99"
    descount "9.99"
    change ""
    state "MyString"
  end
end
