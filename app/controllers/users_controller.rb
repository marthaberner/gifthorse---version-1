class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)
    hashed_password = BCrypt::Password.create(params[:user][:password])
    @user.password = hashed_password

    if  @user.save
      redirect_to '/', notice: "Your account has been created.  You may login."
    else
      render "welcome/index"
    end
  end

  private

  def allowed_parameters
    params.require(:user).permit(:username, :password)
  end
end