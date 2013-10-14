module Helper
	def destroy_room_reservations
		RoomReservation.destroy_all
	end
end