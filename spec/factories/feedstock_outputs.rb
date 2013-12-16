# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedstock_output, :class => 'Feedstock::Output' do
    status "MyString"
    date "2013-12-13 14:26:01"
    employee "MyString"
  end
end
