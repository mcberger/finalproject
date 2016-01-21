FactoryGirl.define do
	factory :user do
		fname "Test"
		lname "Test"
		email "test@test.com"
		password "testtest"
		admin true
		function "T-function"
		establishment "T-establishment"
	end	
end