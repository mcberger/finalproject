class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
  end

  def show
  end

  def new
    @availability = Availability.new
    @events = Event.all
  end

  def create
    @availability = Availability.new(availability_params)
    @events = Event.all
    @availability.user = current_user
    if current_user != nil && @availability.save
      flash[:notice] = "Your availability has been saved successfully."
      redirect_to availabilities_path
    else
      flash[:alert] = "There was a problem saving your availability."
      redirect_to home_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def availability_params
    params.require(:availability).permit(:user_id, :date, :day, :night)
  end
end
