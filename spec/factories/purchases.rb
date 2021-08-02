FactoryBot.define do
  factory :purchase do
    user { nil }
    listing { nil }
    invoice { nil }
    payment_intent { "MyString" }
    receipt_url { "MyString" }
  end
end
