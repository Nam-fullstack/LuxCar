require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        listing: nil,
        location: nil,
        name: "Name",
        message: "MyText",
        confirmed: false
      ),
      Event.create!(
        listing: nil,
        location: nil,
        name: "Name",
        message: "MyText",
        confirmed: false
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
