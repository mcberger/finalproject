module UsersHelper

	def user_link user
		link_text = if user == current_user
			'you'
		else
			"#{user.fname} #{user.lname}"
		end
		link_to link_text, user_path(user)
	end
end
