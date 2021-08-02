class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address, null: false, foreign_key: true
      t.integer :postcode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
