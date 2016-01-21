FactoryGirl.define do
	factory :availability do
		user_id 1
		date Date.today
		day true
		night false
	end	

	factory :availability_two do
		user_id 1
		date Date.today
		day true
		night true
	end	

end
