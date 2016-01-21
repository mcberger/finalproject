require 'rails_helper'

RSpec.describe Event, :type => :model do

	describe "is invalid without a" do
		it "name" do
			event = build(:event)
			event.name = nil
			expect(event).to be_invalid
		end

		it "start_time" do
			event = build(:event)
			event.start_time = nil
			expect(event).to be_invalid
		end
	end
end