FactoryBot.define do
  factory :article do
    title { "Sample article" }
    content { "Sample content" }
    sequence(:slug) { |n| "default-slug-#{n}"}
  end
end
