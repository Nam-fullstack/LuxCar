class CreateTransmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :transmissions do |t|
      t.string :name
      t.integer :speed, foreign_key: true

      t.timestamps
    end
  end
end
