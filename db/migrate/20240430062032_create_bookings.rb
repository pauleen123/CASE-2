class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :clientId
      t.integer :roomId
      t.date :checkInDate
      t.date :checkOutDate
      t.integer :totalAmount

      t.timestamps
    end
  end
end
