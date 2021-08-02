FactoryBot.define do
  factory :message do
    user { nil }
    chat { nil }
    metadata { "MyText" }
    read { false }
  end
end
