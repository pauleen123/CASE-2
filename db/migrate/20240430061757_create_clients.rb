class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :firstName
      t.string :lastName
      t.integer :nationalID
      t.integer :phone

      t.timestamps
    end
  end
end
