class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = 'Availabilities'
  end

  def show
  end

  def new
    @availability = Availability.new
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
    #@availability = Array.new (7) {Availability.new}
    @events = Event.all
    @title = 'New availability'
  end

  def create
    @events = Event.joins(:user).where('users.establishment = ?', current_user.establishment)
    @availability = Availability.new(availability_params)
    # @availability = params[:availability].values.collect { |availability| Availability.new(availability)}
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
