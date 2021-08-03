class CreateDoors < ActiveRecord::Migration[6.1]
  def change
    create_table :doors do |t|
      t.integer :name
      t.references :body_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
