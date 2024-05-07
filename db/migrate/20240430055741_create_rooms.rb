class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :roomtype
      t.boolean :status
      t.integer :price

      t.timestamps
    end
  end
end
