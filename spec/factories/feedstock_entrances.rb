# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedstock_entrance, :class => 'Feedstock::Entrance' do
    supplier nil
    date "2013-12-05 09:30:02"
    status "MyString"
  end
end
