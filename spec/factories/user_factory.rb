FactoryGirl.define do
  sequence(:user_email) { |i| "user#{i}@example.com" }

  factory :user do
    email { generate(:user_email) }
    password  "password"
    password_confirmation "password"
  end
end
