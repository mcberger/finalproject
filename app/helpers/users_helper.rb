module UsersHelper

	def you_user user
		if user == current_user
			'you'
		else
			"#{user.fname} #{user.lname}"
		end
	end


	def user_delete user
		if current_user.admin?
			link_to 'delete', user_path(user), method: :delete
		else
		end
	end
end

