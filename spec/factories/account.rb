FactoryGirl.define do
  factory :account do
    balance Faker::Number.between(100, 10000)
    currency Faker::Currency.code
    association :user, factory: :user
  end
end
