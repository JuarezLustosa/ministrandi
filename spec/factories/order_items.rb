# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item, :class => 'Order::Item' do
    product nil
    quantity 1
    price 1.5
  end
end
