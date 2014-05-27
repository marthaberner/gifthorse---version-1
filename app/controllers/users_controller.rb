class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @gift = Gift.new
    @gifts = Gift.all
  end

  def index
    @user = User.new
  end
end