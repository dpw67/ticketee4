FactoryGirl.define do
  factory :user do
    name "Example user"
    email "user@gmail.com"
    password "password"
    password_confirmation "password"
  end
end
