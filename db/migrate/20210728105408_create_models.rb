class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.string :name
      t.references :make, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
