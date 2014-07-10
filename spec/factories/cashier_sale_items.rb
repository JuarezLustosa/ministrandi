# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cashier_sale_item, :class => 'Cashier::Sale::Items' do
    sale nil
    product nil
    unit_price "9.99"
    descount "9.99"
    state false
    canceled_reason 1
  end
end
