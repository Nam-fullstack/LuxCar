class AddSellersAndBuyersToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_reference :invoices, :buyer, index: true
    add_reference :invoices, :seller, index: true
    
    add_foreign_key :invoices, :users, column: :buyer_id
    add_foreign_key :invoices, :users, column: :seller_id
  end
end
