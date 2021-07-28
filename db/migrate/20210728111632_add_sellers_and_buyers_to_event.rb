class AddSellersAndBuyersToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :buyer, index: true
    add_reference :events, :seller, index: true

    add_foreign_key :events, :users, column: :buyer_id
    add_foreign_key :events, :users, column: :seller_id
  end
end
