class UsersController < ApplicationController
  def index
    your_establishment = current_user.establishment
    @users = User.where(establishment:your_establishment)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted successfully."
    else
      flash[:alert] = "There was a problem deleting the user."
    end
    redirect_to users_path
  end

  def add_new_users
    @user = User.new
    @title = 'New user'
  end

  def create_new_users
    @user = User.new(user_params)
    your_establishment = current_user.establishment
    @user.establishment = your_establishment
    @user.admin = false
    @user.password = "12345678"

    if @user.save
      UserMailer.welcome_email_alt(@user).deliver_later
      flash[:notice] = "User #{@user.email} created successfully."
      redirect_to users_path
    else
      flash.now[:alert] = "Failed to create user #{@user.email}."
      render "add_new_users"
    end
  end

  private
  def user_params
    params.require(:user).permit(:fname, :lname, :function, :establishment, :email, :password)
  end

end
