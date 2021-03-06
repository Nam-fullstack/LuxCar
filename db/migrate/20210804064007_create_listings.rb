class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :variant, foreign_key: true
      t.integer :price, null: false
      t.integer :mileage, null: false
      t.string :title
      t.text :description
      t.references :state, null: false, foreign_key: true
      t.integer :postcode, null: false
      t.boolean :sold, default: false
      t.integer :deposit

      t.timestamps
    end
  end
end
