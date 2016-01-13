class HomeController < ApplicationController
  def index
  	if current_user
  		@events = Event.joins(:user).where('users.establishment = ?', current_user.establishment)
  	else
  	end
  	@title = "Rooster"
  end

  def about
  	@title = "About"
  end
end
