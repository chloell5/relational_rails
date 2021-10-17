class GymsController < ApplicationController

  def index
    @gyms = Gym.all.order(created_at: :desc)
  end

  def new
  end

  def create
    gym = Gym.create!(gym_params)
    redirect_to "/gyms"
  end

  def show
    @gym = Gym.find(params[:id])
    @activity_count = @gym.activities.count
  end

  def gym_params
    #require "pry"; binding.pry
    params.permit(:name, :location, :open, :rank)
  end

end
