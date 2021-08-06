class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.references :make, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true
      t.references :engine, null: false, foreign_key: true
      t.references :speed, null: false, foreign_key: true
      t.references :fuel, null: false, foreign_key: true
      t.references :door, null: false, foreign_key: true
      t.references :body_type, null: false, foreign_key: true
      t.references :drive_type, null: false, foreign_key: true
      t.references :transmission, null: false, foreign_key: true
      t.integer :fuel_consumption
      t.integer :safety_rating
      t.integer :weight
      t.integer :displacement, precision: 10, scale: 1
      t.integer :power

      t.timestamps
    end
  end
end
