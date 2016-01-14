class SchedulesController < ApplicationController
  def index
  end

  def show
    @schedule = Schedule.find(params[:id])
    @events = Event.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = 'Week ' + @schedule.week.to_s
  end

  def new
    @schedule = Schedule.new
    @availabilities = Availability.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = 'New schedule'
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if current_user.admin? && @schedule.save
        flash[:notice] = "Your schedule was created successfully."
        redirect_to @schedule
      else
        flash[:alert] = "There was a problem saving your schedule."
        redirect_to new_schedule_path
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def schedule_params
    params.require(:schedule).permit(
      :week, :year, :day_one, :day_two, :day_three, :day_four, :day_five, :day_six, 
      :day_seven, :d_one_nine, :d_one_ten, :d_one_eleven, :d_one_twelve, :d_one_thirteen, 
      :d_one_fourteen, :d_one_fifteen, :d_one_sixteen, :d_one_seventeen, :d_one_eighteen, 
      :d_one_nineteen, :d_one_twenty, :d_two_nine, :d_two_ten, :d_two_eleven, :d_two_twelve, 
      :d_two_thirteen, :d_two_fourteen, :d_two_fifteen, :d_two_sixteen, :d_two_seventeen, 
      :d_two_eighteen, :d_two_nineteen, :d_two_twenty, :d_three_nine, :d_three_ten,
      :d_three_eleven, :d_three_twelve, :d_three_thirteen, :d_three_fourteen, :d_three_fifteen, 
      :d_three_sixteen, :d_three_seventeen, :d_three_eighteen, :d_three_nineteen, :d_three_twenty, 
      :d_four_nine, :d_four_ten, :d_four_eleven, :d_four_twelve, :d_four_thirteen, :d_four_fourteen, 
      :d_four_fifteen, :d_four_sixteen, :d_four_seventeen, :d_four_eighteen, :d_four_nineteen, 
      :d_four_twenty, :d_five_nine, :d_five_ten, :d_five_eleven, :d_five_twelve, :d_five_thirteen, 
      :d_five_fourteen, :d_five_fifteen, :d_five_sixteen, :d_five_seventeen, :d_five_eighteen, 
      :d_five_nineteen, :d_five_twenty, :d_six_nine, :d_six_ten, :d_six_eleven, :d_six_twelve, 
      :d_six_thirteen, :d_six_fourteen, :d_six_fifteen, :d_six_sixteen, :d_six_seventeen, 
      :d_six_eighteen, :d_six_nineteen, :d_six_twenty, :d_seven_nine, :d_seven_ten, :d_seven_eleven, 
      :d_seven_twelve, :d_seven_thirteen, :d_seven_fourteen, :d_seven_fifteen, :d_seven_sixteen, 
      :d_seven_seventeen, :d_seven_eighteen, :d_seven_nineteen, :d_seven_twenty
      )
  end
end
