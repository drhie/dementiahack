class SessionsController < ApplicationController
  def index
    render :layout => "homepage"
    @user = Resident.find(session[:user_id]) if session[:type] == "Resident"
    @user = Volunteer.find(session[:user_id]) if session[:type] == "Volunter"
  end

  def new
  end

  def create
    user = Resident.find_by(email: params[:email]) || Volunteer.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      session[:type] = user.class.name
      session[:user] = user
      flash[:notice] = "Logged in!"
      redirect_to volunteer_path(user.id) if session[:type] == "Volunteer"
      redirect_to resident_path(user.id) if session[:type] == "Resident"
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
