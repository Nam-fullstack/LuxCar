class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :engine, null: false, foreign_key: true
      t.references :transmission, null: false, foreign_key: true
      t.references :fuel, null: false, foreign_key: true
      t.references :body_type, null: false, foreign_key: true
      t.integer :safety_rating
      t.decimal :displacement, precision: 10, scale: 1
      t.integer :power
      t.integer :weight
      t.integer :width
      t.integer :length
      t.integer :height

      t.timestamps
    end
  end
end
