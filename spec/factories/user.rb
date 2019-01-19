FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{FFaker::Internet.email}-#{n}" }
    password FFaker::Internet.password
  end
end
