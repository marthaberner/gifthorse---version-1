class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)
    if @user.save
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def allowed_parameters
    params.require(:username).permit(:password)
  end
end