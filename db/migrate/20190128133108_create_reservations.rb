class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.integer :user_id
      t.integer :lunch_box_id
      t.boolean :reserved

      t.timestamps
    end
  end
end
