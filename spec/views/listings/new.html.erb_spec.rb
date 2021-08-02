require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      user: nil,
      variant: nil,
      colour: nil,
      title: "MyString",
      price: 1,
      mileage: 1,
      description: "MyText",
      state: nil,
      sold: false
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[variant_id]"

      assert_select "input[name=?]", "listing[colour_id]"

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[mileage]"

      assert_select "textarea[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[state_id]"

      assert_select "input[name=?]", "listing[sold]"
    end
  end
end
