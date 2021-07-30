class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :engine, foreign_key: true
      t.references :transmission, foreign_key: true
      t.references :fuel, foreign_key: true
      t.references :body_type, foreign_key: true
      t.integer :safety_rating
      t.decimal :displacement, precision: 10, scale: 1
      t.integer :power
      t.integer :weight

      t.timestamps
    end
  end
end
