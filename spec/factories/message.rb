FactoryGirl.define do
  factory :message do
    title Faker::Lorem.sentence
    text FFaker::Lorem.paragraphs(1).first
    association :user, factory: :user
  end
end
