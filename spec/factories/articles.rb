FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: Random.new.rand(1..50)) }
    body { Faker::Lorem.paragraph }
    status { :draft }
    user

    trait :published do
      status { :published }
    end
  end
end
