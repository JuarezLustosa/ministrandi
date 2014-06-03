# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_exchange_item do
    order nil
    product nil
    quantity 1
    state false
    canceled_reason 1
  end
end
