class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.references :make, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
