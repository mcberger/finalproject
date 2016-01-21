FactoryGirl.define do
	factory :post do
		title "title1"
		body "body1"
		user_id 1
	end	

	factory :invalid_post, class: Post do
		title nil
		body nil
		user_id 1
	end	

	factory :updated_post, class: Post do
		title "title 1"
		body "body 1"
		user_id 1
	end	
end