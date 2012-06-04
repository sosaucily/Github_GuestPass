FactoryGirl.define do
  factory :programmer do
    #email { |n| "test#{n}@example.com" }
    sequence(:email) { |n| "test#{n}@example.com" }
    #password "secret"
  end
end