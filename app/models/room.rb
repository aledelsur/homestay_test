class Room < ActiveRecord::Base
	belongs_to 	:host, primary_key: "ref", foreign_key: "host_ref"
	has_many	 	:bookings, primary_key: "ref", foreign_key: "room_ref"
	has_many		:room_reservations, primary_key: "ref", foreign_key: "room_ref"

	scope :with_availability, ->(guests, start_date, end_date) { includes(:room_reservations).where("rooms.capacity >= ? AND ((room_reservations.disponibility >= ? AND room_reservations.date BETWEEN ? AND ?) OR (room_reservations.room_ref IS NULL))", guests, guests, start_date, end_date).references(:rooms, :room_reservations).group_by { |room| room.host }.to_a }

	# This method returns the disponibility of the room (as Integer).
	# It makes sense since some days in the selected period the room could have different disponibilities.
	# In the case of having different disponibilities, disponibility is set as the minimum disponibility
	# => i.e: from a given period 01-06-2013 to 03-06-2013 the first day has 1 available bed in the room, and the second day has 2 available beds.
	# => In this example, the disponibility shown to the user will be 1.
	def min_disponibility
		room_reservations.collect { |rr| rr.disponibility  }.min
	end

	# This method returns the number of bookings made for the room (as Integer).
	def number_of_bookings
		room_reservations.empty? ? 0 : capacity - min_disponibility
	end

	# This method returns the number of available beds for the room (as Integer).
	def number_of_free
		room_reservations.empty? ? capacity : capacity - number_of_bookings
	end
end
