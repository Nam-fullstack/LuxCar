require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
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

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

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
