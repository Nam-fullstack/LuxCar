FactoryBot.define do
  factory :location do
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postcode { 1 }
    longitude { 1.5 }
    latitude { 1.5 }
  end
end
