FactoryGirl.define do
	factory :event do
		name "Event1"
		start_time Time.now
		user_id 1
	end	

	factory :invalid_event, class: Event do
		name nil
		start_time Time.now
		user_id 1
	end

	factory :updated_event, class: Event do
		name "event 1"
		start_time "2016-01-23 17:00:00000000000 +0100"
		user_id 1
	end
end