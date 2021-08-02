class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :year, null: false, foreign_key: true
      t.references :engine, null: false, foreign_key: true
      t.references :transmission, null: false, foreign_key: true
      t.references :fuel, null: false, foreign_key: true
      t.references :body_type, null: false, foreign_key: true
      t.references :drive, null: false, foreign_key: true
      t.integer :fuel_consumtion
      t.integer :safety_rating
      t.integer :weight
      t.integer :displacement
      t.integer :power

      t.timestamps
    end
  end
end
