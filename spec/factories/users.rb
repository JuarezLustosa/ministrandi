FactoryGirl.define do
  factory :user do
    name "Jonh"
    email "jonh@me.com"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :admin, class: User do
    name "Admin"
    email "admin@me.com"
    password "12345678"
    password_confirmation "12345689"
  end
end
