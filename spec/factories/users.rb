FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    # sequenceを使って重複しないようにする
    sequence(:account) {|n| "#{n}_#{Faker::Internet.username}" }
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password(min_length: 8, max_length: 12, mix_case: true) }
  end
end
