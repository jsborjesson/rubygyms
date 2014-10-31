class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  # TODO: Refactor
  def create
    email, password = params[:user].values_at(:email, :password)
    user = User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Welcome, #{user.email}"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to new_session_path
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :owner)
  end

end
