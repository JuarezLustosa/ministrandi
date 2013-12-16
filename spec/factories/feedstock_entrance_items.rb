# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedstock_entrance_item, :class => 'Feedstock::Entrance::Item' do
    feedstock ""
    entrance_id 1
    quantity 1
    price_unit "9.99"
  end
end
