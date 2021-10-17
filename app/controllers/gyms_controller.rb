class GymsController < ApplicationController

  def index
    @gyms = Gym.all.order(created_at: :desc)
  end

  def new
  end

  def create
    gym = Gym.create(name: params[:name])
    redirect_to "/gyms"
  end

  def show
    @gym = Gym.find(params[:id])
    @activity_count = @gym.activities.count
  end

end
