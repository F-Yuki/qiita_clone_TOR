FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: Random.new.rand(1..100)) }
    body { Faker::Lorem.paragraph }
    status { :draft }
    user

    trait :published_status do
      status { :published }
    end
  end
end
