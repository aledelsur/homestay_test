require 'spec_helper'
require 'helper'
include Helper

describe Room do
  context "testing methods" do
  	context "with reservations created" do
	  	before(:all) do
	  		FactoryGirl.create(:room)
	  		FactoryGirl.create(:room_reservation1)
	  		FactoryGirl.create(:room_reservation2)
	  		FactoryGirl.create(:room_reservation3)
	  		FactoryGirl.create(:room_reservation4)
	  		FactoryGirl.create(:room_reservation5)
	  		FactoryGirl.create(:room_reservation6)
	  		FactoryGirl.create(:room_reservation7)
	  	end

	  	after(:all) do
	  		destroy_room_reservations
	  	end

	  	it "returns the number of bookings" do
	  		room = Room.first
	  		expect(room.number_of_bookings).to eq(1)
	  	end

	  	it "returns the number of available beds" do
	  		room = Room.first
	  		expect(room.number_of_free).to eq(room.capacity-room.number_of_bookings)
	  	end

	  	it "returns the minimum disponibility for all room reservations" do
	  		room = Room.first
	  		expect(room.min_disponibility).to eq(1)
	  	end
  	end

  	context "without reservations created" do
	  	before(:all) do
	  		FactoryGirl.create(:room)
	  	end

	  	it "returns the number of bookings" do
	  		room = Room.first
	  		expect(room.number_of_bookings).to eq(0)
	  	end

	  	it "returns the number of available beds" do
	  		room = Room.first
	  		expect(room.number_of_free).to eq(room.capacity)
	  	end
  	end

  end



end
