class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.references :colour, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :mileage, null: false
      t.string :title
      t.text :description
      t.references :state, null: false, foreign_key: true
      t.integer :postcode, null: false
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
