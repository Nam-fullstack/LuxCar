class CreateSpeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :speeds do |t|
      t.integer :name

      t.timestamps
    end
  end
end
