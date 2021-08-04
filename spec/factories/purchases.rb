FactoryBot.define do
  factory :purchase do
    listing { nil }
    user { nil }
    invoice { nil }
    payment_intent { "MyString" }
    receipt_url { "MyString" }
    status { false }
  end
end
