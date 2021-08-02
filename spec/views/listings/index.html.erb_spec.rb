require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        user: nil,
        variant: nil,
        colour: nil,
        title: "Title",
        price: 2,
        mileage: 3,
        description: "MyText",
        state: nil,
        sold: false
      ),
      Listing.create!(
        user: nil,
        variant: nil,
        colour: nil,
        title: "Title",
        price: 2,
        mileage: 3,
        description: "MyText",
        state: nil,
        sold: false
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
