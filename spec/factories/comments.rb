FactoryBot.define do
  factory :comment do
    # 文字列、行、文章
    body { Faker::Lorem.sentence }
    user
    article
  end
end
