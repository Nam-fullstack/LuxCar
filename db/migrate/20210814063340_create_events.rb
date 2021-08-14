class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :listing, null: false, foreign_key: true
      t.string :address, null: false
      t.integer :postcode, null: false
      t.string :name
      t.datetime :start_time, null: false
      t.text :message
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
