require 'csv'

namespace :import do
  desc "Import all Hosts, Rooms and Bookings"
  task import_data: :environment do

  	# Import all hosts
  	if Host.first.nil?
			csv_text = File.read('public/hosts-2000.csv')
			csv = CSV.parse(csv_text, :headers => true)
			csv.each_with_index do |row, index|
			  Host.create!(row.to_hash)
			  puts "number: "+index.inspect
			  puts "row "+row.inspect
			end
		end

		# Import all rooms
		if Room.first.nil?
			csv_text = File.read('public/rooms-2000.csv')
			csv = CSV.parse(csv_text, :headers => true)
			csv.each_with_index do |row, index|
			  Room.create!(row.to_hash)
			  puts "number: "+index.inspect
			  puts "row "+row.inspect
			end
		end

		# Import all bookings
		if Booking.first.nil?
			csv_text = File.read('public/bookings-2000.csv')
			csv = CSV.parse(csv_text, :headers => true)
			csv.each_with_index do |row, index|
				Booking.create!(row.to_hash)
			  puts "number: "+index.inspect
			  puts "row "+row.inspect
			end
		end

		# Create room_reservations. For each of day included in the booking, 1 record will be created.
		if RoomReservation.first.nil?
			bookings = Booking.all
			bookings.each do |booking|
				(booking.start_date..booking.end_date).each do |date|
					room_reservation = RoomReservation.where("room_ref = ? AND date = ?", booking.room_ref, date)
					if not room_reservation.empty? # if exists record, update the disponibility
						disp = room_reservation.disponibility
						room_reservation.update_attributes(disponibility: disp-booking.number_of_guests)
					else
						room_reservation = RoomReservation.create!(room_ref: booking.room_ref, date: date, disponibility: booking.room.capacity-booking.number_of_guests)
					end
					puts "record: "+room_reservation.inspect
				end
			end
		end
  end

end
