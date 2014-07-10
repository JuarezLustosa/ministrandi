# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cashier_entrance, :class => 'Cashier::Entrance' do
    money "9.99"
    user_id nil
  end
end
