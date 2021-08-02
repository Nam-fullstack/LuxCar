class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.references :colour, null: false, foreign_key: true
      t.string :title
      t.integer :price
      t.integer :mileage
      t.text :description
      t.references :state, null: false, foreign_key: true
      t.boolean :sold

      t.timestamps
    end
  end
end
