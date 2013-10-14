class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.string			:ref
    	t.string			:room_ref
    	t.date		    :start_date
    	t.date		    :end_date
    	t.integer			:number_of_guests

      t.timestamps
    end
  end
end
