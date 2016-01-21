require 'rails_helper'

RSpec.describe Availability, :type => :model do	

	describe "testing for Availability method" do
		it "start_time" do
			availability = build(:availability)
			expect(availability.start_time).to eq("Thu, 21 Jan 2016 00:00:00 +0000")
		end
	end
end