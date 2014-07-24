# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_group, :class => 'Product::Group' do
    name "MyString"
    ancestry "MyString"
  end
end
