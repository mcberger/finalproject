class HomeController < ApplicationController
  def index
  	@events = Event.all
  	@title = "Rooster"
  end

  def about
  	@title = "About"
  end
end
