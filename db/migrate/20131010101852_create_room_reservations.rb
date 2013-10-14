class CreateRoomReservations < ActiveRecord::Migration
  def change
    create_table :room_reservations do |t|
    	t.date				:date
    	t.string			:room_ref
    	t.integer			:disponibility

      t.timestamps
    end
  end
end
