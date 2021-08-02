class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :year, null: false, foreign_key: true
      t.references :engine, foreign_key: true
      t.references :transmission, foreign_key: true
      t.references :fuel, foreign_key: true
      t.references :body_type, foreign_key: true
      t.references :drive_type, foreign_key: true
      t.integer :fuel_consumption
      t.integer :safety_rating
      t.integer :weight
      t.integer :displacement
      t.integer :power

      t.timestamps
    end
  end
end
