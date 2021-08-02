class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.references :colour, foreign_key: true
      t.string :title
      t.integer :price
      t.integer :mileage
      t.text :description
      t.references :state, null: false, foreign_key: true
      t.integer :postcode, null: false
      t.boolean :sold

      t.timestamps
    end
  end
end
