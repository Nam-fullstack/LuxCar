class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :name
      t.datetime :start_time
      t.text :message
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
