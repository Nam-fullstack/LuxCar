class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :listing, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
