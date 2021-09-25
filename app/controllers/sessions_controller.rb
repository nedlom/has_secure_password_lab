class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    else
      redirect_to login_path, alert: "Invalid Name or Password"
    end
  end

  def destroy
  end

end