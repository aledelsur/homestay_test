class HomeController < ApplicationController
	def index
	end

	def search
		@start_date = params[:start_date].to_date
		@end_date 	= params[:end_date].to_date
		@guests			= params[:guests]

		rooms = Room.with_availability(@guests, @start_date, @end_date)

		@rooms = Kaminari.paginate_array(rooms).page(params[:page]).per(5)
		render :layout => "results"
	end
end