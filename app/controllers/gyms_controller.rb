class GymsController < ApplicationController

  def index
    @gyms = Gym.all
  end

  def show
    @gyms = Gym.find(params[:id])
  end

  def activities
    @gym = Gym.find_by(id: params[:id])
    @gym_activities = @gym.activities
  end

end
