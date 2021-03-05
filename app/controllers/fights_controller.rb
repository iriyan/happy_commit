class FightsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @fight = Fight.new(
      user_id: @current_user.id, 
      goal_id: params[:goal_id]
      )
    @fight.save
    redirect_to("/goals/#{params[:goal_id]}")
  end

  def destroy
    @fight = Fight.find_by(
      user_id: @current_user.id, 
      goal_id: params[:goal_id]
      )
    @fight.destroy
    redirect_to("/goals/#{params[:goal_id]}")
  end
  
end