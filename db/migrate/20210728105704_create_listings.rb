class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :make, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true
      t.integer :year, null: false
      t.integer :price
      t.integer :mileage
      t.string :title
      t.text :description
      t.boolean :sold

      t.timestamps
    end
  end
end
