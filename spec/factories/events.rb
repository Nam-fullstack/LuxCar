FactoryBot.define do
  factory :event do
    listing { nil }
    location { nil }
    name { "MyString" }
    start_time { "2021-08-02 16:15:56" }
    message { "MyText" }
    confirmed { false }
  end
end
