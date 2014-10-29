class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :email
      t.text :message
      t.date :reserve_date
      t.time :reserve_time

      t.timestamps
    end
  end
end
