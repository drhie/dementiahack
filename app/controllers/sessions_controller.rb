class SessionsController < ApplicationController

  def new
  end

  def create
    user = Pwd.find_by(email: params[:email]) || Volunteer.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      session[:type] = user.class.name
      session[:user] = user
      flash[:notice] = "Logged in!"
      redirect_to root_url
    else
      flash.now[:alert] = "Login failed."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Goodbye!"
  end
end
