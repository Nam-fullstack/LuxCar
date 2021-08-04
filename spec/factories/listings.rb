FactoryBot.define do
  factory :listing do
    user { nil }
    variant { nil }
    colour { nil }
    price { 1 }
    mileage { 1 }
    title { "MyString" }
    description { "MyText" }
    state { nil }
    postcode { 1 }
    sold { false }
  end
end
