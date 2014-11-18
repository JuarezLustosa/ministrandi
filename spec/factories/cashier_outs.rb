# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cashier_out, :class => 'Cashier::Out' do
    cashier nil
    money "9.99"
    user nil
  end
end
