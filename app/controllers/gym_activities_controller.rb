class GymActivitiesController < ApplicationController
  def index
    @gym = Gym.find_by(id: params[:id])
    @activities = @gym.activities
  end    
end
