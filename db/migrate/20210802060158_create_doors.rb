class CreateDoors < ActiveRecord::Migration[6.1]
  def change
    create_table :doors do |t|
      t.integer :name

      t.timestamps
    end
  end
end
