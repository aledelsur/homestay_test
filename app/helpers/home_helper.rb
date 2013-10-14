module HomeHelper
	def mention_guests(guests)
		if guests == "1"
			"1 guest"
		else
			"#{guests} guests"
		end
	end
end
