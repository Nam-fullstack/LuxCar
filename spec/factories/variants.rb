FactoryBot.define do
  factory :variant do
    model { nil }
    year { nil }
    engine { nil }
    speed { nil }
    fuel { nil }
    door { nil }
    drive_type { nil }
    fuel_consumption { 1 }
    safety_rating { 1 }
    weight { 1 }
    displacement { 1 }
    power { 1 }
  end
end
