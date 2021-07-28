FactoryBot.define do
  factory :event do
    date { "2021-07-28" }
    time { "2021-07-28 21:11:48" }
    location { nil }
    message { "MyText" }
    confirmed { false }
  end
end
