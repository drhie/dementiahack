class MatchesController < ApplicationController
  def get_matches
    @user = Resident.find(session[:user_id])
    @matches = Match.calculate_match(@user)
    @matched_people_matched_availabilities = Availability.matched_people_matched_availabilities(@user)
  end

  def show_match
    @resident = Resident.find(session[:user_id])
    @volunteer = Match.find(params[:id]).volunteer
  end
end
