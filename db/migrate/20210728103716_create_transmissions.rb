class CreateTransmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :transmissions do |t|
      t.string :type

      t.timestamps
    end
  end
end
