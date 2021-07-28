class CreateFuels < ActiveRecord::Migration[6.1]
  def change
    create_table :fuels do |t|
      t.string :type

      t.timestamps
    end
  end
end
