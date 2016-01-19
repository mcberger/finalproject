class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = 'Availabilities'
  end

  def show
    @availability = Availability.find(params[:id])
    @title = @availability.user.fname + ": " + @availability.date.strftime("%d/%m/%Y")
  end

  def new
    @availability = Availability.new
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
    #@availability = Array.new (7) {Availability.new}
    @events = Event.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = 'New availability'
  end

  def create
    @availability = Availability.new(availability_params)
    # @availability = params[:availability].values.collect { |availability| Availability.new(availability)}
    @availability.user = current_user
    if current_user != nil && @availability.save
      flash[:notice] = "Your availability has been saved successfully."
      redirect_to availabilities_path
    else
      flash[:alert] = "There was a problem saving your availability."
      redirect_to availabilities_path
    end
  end

  def edit
    @availability = Availability.find(params[:id])
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
    @events = Event.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = 'Edit availability'
  end

  def update
    availability = Availability.find(params[:id])
    if availability.update_attributes availability_params
      flash[:notice] = "Your availability was updated successfully."
      redirect_to availabilities_path
    else
      flash[:alert] = "There was a problem updating your availability."
      redirect_to(:back)
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
      if @availability.destroy
        flash[:notice] = "Your availability was deleted successfully."
        redirect_to availabilities_path
      else
        flash[:alert] = "There was a problem deleting your availability."
        redirect_to @availability
      end
  end

  private
  def availability_params
    params.require(:availability).permit(:user_id, :date, :day, :night)
  end
end
