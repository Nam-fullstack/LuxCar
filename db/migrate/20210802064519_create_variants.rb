class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :year, null: false, foreign_key: true
      t.references :engine, foreign_key: true, default: "N/A"
      t.references :transmission, foreign_key: true, default: "N/A"
      t.references :fuel, null: false, foreign_key: true
      t.references :body_type, null: false, foreign_key: true
      t.references :drive_type, foreign_key: true, default: "N/A"
      t.integer :fuel_consumption, default: "N/A"
      t.integer :safety_rating, default: "N/A"
      t.integer :weight, default: "N/A"
      t.decimal :displacement, precision: 10, scale: 1, default: "N/A"
      t.integer :power, default: "N/A"

      t.timestamps
    end
  end
end
