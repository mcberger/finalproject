require 'rails_helper'

RSpec.describe Post, :type => :model do

	describe "is invalid without a" do
		it "title" do
			post = build(:post)
			post.title = nil
			expect(post).to be_invalid
		end

		it "body" do
			post = build(:post)
			post.body = nil
			expect(post).to be_invalid
		end
	end
end