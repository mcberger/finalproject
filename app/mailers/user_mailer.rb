class UserMailer < ApplicationMailer
	default from: 'rooster@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'http://localhost:3000/users/sign_in'
		mail(to: @user.email, subject: 'Welcome to Rooster!')
	end

	def welcome_email_alt(user)
		@user = user
		@url = 'http://localhost:3000/users/sign_in'
		mail(to: @user.email, subject: 'Welcome to Rooster!')
	end
end