FactoryBot.define do
  factory :event do
    listing { nil }
    location { nil }
    name { "MyString" }
    start_time { "2021-08-04 16:52:20" }
    message { "MyText" }
    confirmed { false }
  end
end
