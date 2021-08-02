FactoryBot.define do
  factory :listing do
    user { nil }
    variant { nil }
    colour { nil }
    title { "MyString" }
    price { 1 }
    mileage { 1 }
    description { "MyText" }
    state { nil }
    sold { false }
  end
end
