class CreateBodyTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :body_types do |t|
      t.string :name
      t.references :door, foreign_key: true

      t.timestamps
    end
  end
end
