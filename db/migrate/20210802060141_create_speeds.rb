class CreateSpeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :speeds do |t|
      t.integer :name
      t.references :transmission, foreign_key: true

      t.timestamps
    end
  end
end
