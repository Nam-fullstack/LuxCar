class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.references :location, foreign_key: true
      t.text :message
      t.boolean :confirmed

      t.timestamps
    end
  end
end
