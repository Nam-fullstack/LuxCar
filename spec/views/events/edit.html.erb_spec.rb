require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      listing: nil,
      location: nil,
      name: "MyString",
      message: "MyText",
      confirmed: false
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[listing_id]"

      assert_select "input[name=?]", "event[location_id]"

      assert_select "input[name=?]", "event[name]"

      assert_select "textarea[name=?]", "event[message]"

      assert_select "input[name=?]", "event[confirmed]"
    end
  end
end
