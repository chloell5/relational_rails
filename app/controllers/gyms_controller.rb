class GymsController < ApplicationController

  def index
    @gyms = Gym.all.order(created_at: :desc)
  end

  def new
  end

  def create
    gym = Gym.create!(gym_params)
    redirect_to '/gyms'
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    @gym.update(gym_params)
    redirect_to "/gyms/#{@gym.id}"
  end

  def show
    @gym = Gym.find(params[:id])
    @activity_count = @gym.activities.count
  end

  private

    def gym_params
      params.permit(:name, :location, :open, :rank)
    end

end
