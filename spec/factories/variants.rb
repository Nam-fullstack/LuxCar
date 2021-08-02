FactoryBot.define do
  factory :variant do
    name { "MyString" }
    year { nil }
    engine { nil }
    transmission { nil }
    fuel { nil }
    body_type { nil }
    drive { nil }
    fuel_consumtion { 1 }
    safety_rating { 1 }
    weight { 1 }
    displacement { 1 }
    power { 1 }
  end
end
