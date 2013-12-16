# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedstock_output_item, :class => 'Feedstock::Output::Item' do
    feedstock nil
    output_id 1
    quantity 1
  end
end
