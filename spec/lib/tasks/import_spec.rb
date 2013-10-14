require 'spec_helper'

describe "import_data" do
	it "existing files" do
		File.exist?("public/bookings-2000.csv").should be_true
		File.exist?("public/hosts-2000.csv").should be_true
		File.exist?("public/rooms-2000.csv").should be_true
	end
end