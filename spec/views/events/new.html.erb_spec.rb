require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      listing: nil,
      location: nil,
      name: "MyString",
      message: "MyText",
      confirmed: false
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[listing_id]"

      assert_select "input[name=?]", "event[location_id]"

      assert_select "input[name=?]", "event[name]"

      assert_select "textarea[name=?]", "event[message]"

      assert_select "input[name=?]", "event[confirmed]"
    end
  end
end
