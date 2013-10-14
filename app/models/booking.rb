class Booking < ActiveRecord::Base
	belongs_to 	:room, primary_key: "ref", foreign_key: "room_ref"
end
