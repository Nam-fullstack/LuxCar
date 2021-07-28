FactoryBot.define do
  factory :listing do
    user { nil }
    make { nil }
    model { nil }
    price { 1 }
    mileage { 1 }
    title { "MyString" }
    description { "MyText" }
    sold { false }
  end
end
