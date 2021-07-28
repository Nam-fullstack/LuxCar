FactoryBot.define do
  factory :purchase do
    invoice { nil }
    listing { nil }
    payment_intent { "MyString" }
    receipt_url { "MyString" }
  end
end
