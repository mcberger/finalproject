require 'rails_helper'

RSpec.describe User, :type => :model do

	describe "is invalid without a" do
		it "fname" do
			user = build(:user)
			user.fname = nil
			expect(user).to be_invalid
		end

		it "lname" do
			user = build(:user)
			user.lname = nil
			expect(user).to be_invalid
		end

		it "establishment" do
			user = build(:user)
			user.establishment = nil
			expect(user).to be_invalid
		end

		it "email" do
			user = build(:user)
			user.email = nil
			expect(user).to be_invalid
		end

		it "password" do
			user = build(:user)
			user.password = nil
			expect(user).to be_invalid
		end
	end
end