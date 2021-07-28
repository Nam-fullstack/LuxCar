FactoryBot.define do
  factory :variant do
    name { "MyString" }
    engine { nil }
    transmission { nil }
    fuel { nil }
    body_type { nil }
    weight { 1 }
    width { 1 }
    length { 1 }
    height { 1 }
  end
end
