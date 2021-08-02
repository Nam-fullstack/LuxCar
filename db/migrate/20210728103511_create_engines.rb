class CreateEngines < ActiveRecord::Migration[6.1]
  def change
    create_table :engines do |t|
      t.string :name
      t.decimal :displacement, precision: 10, scale: 1

      t.timestamps
    end
  end
end
