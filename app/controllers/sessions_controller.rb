class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user.present? && decrypted_password(user.password) == params[:password]
      session[:id] = user.id
      flash[:info] = 'You are logged in!'
      redirect_to user_path(user)
    else
      flash[:alert] = 'invalid username/password'
      redirect_to root_path
    end
  end

  private

  def decrypted_password(password_to_decrypt)
    BCrypt::Password.new(password_to_decrypt)
  end

end