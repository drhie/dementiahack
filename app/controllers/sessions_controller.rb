class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = Pwd.find_by(email: params[:email]) || Volunteer.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      session[:type] = user.class.name
      session[:user] = user
      flash[:notice] = "Logged in!"
      redirect_to volunteer_path(user.id) if session[:type] == "Volunteer"
      redirect_to pwd_path(user.id) if session[:type] == "Pwd"
    else
      flash.now[:alert] = "Login failed."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:type] = nil
    redirect_to root_url, notice: "Goodbye!"
  end
end
