FactoryBot.define do
  factory :event do
    listing { nil }
    location { nil }
    name { "MyString" }
    start_time { "2021-08-03 00:04:00" }
    message { "MyText" }
    confirmed { false }
  end
end
