class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :postcode
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
