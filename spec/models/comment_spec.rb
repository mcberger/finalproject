require 'rails_helper'

RSpec.describe Comment, :type => :model do

	describe "is invalid without a" do
		it "text" do
			comment = build(:comment)
			comment.text = nil
			expect(comment).to be_invalid
		end
	end
end